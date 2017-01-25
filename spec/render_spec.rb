require 'spec_helper'

class Post < ActiveRecord::Base
end

describe SlimAssets do
  it "should have the proper format" do
    RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s.should match "<h1><div class=\"text\">Render works</div></h1>"
  end

  it "should use rails helpers" do
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /<form/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /<input/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /'<h1>Form<\/h1>/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /id=&quot;post_title&quot;/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /post\[title\]/
  end

  it "should use application helpers" do
    RailsApp::Application.assets['app_helpers.jst.ejs.slim'].to_s.should == "(function() {\n  this.JST || (this.JST = {});\n  this.JST[\"app_helpers\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h1>App helpers work</h1>');}return __p.join('');};\n}).call(this);\n"
  end
end
