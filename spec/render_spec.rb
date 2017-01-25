require 'spec_helper'

class Post < ActiveRecord::Base
end

describe SlimAssets do
  it "should have the proper format" do
    print RailsApp::Application.assets['link_to.jst.ejs.slim']
    RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s.should eq "(function() {\n  this.JST || (this.JST = {});\n  this.JST[\"link_to\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('h1\\n  .text Render works\\n\\n');}return __p.join('');};\n}).call(this);\n"
  end

  it "should use rails helpers" do
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should == "(function() {\n  this.JST || (this.JST = {});\n  this.JST[\"helpers\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('h1 Form\\n= form_for Post.new, url: \\'/\\' do |f|\\n  = f.text_field :title\\n');}return __p.join('');};\n}).call(this);\n"
  end
end
