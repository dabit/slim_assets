require 'spec_helper'

class Post < ActiveRecord::Base
end

describe SlimAssets do
  it "should have the proper format" do
    RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s.should eq "(function() { this.JST || (this.JST = {}); this.JST[\"link_to\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h1><div class=\"text\">Render works</div></h1>');}return __p.join('');};\n}).call(this);\n"
  end

  it "should use rails helpers" do
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should == "(function() { this.JST || (this.JST = {}); this.JST[\"helpers\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h1>Form</h1><form accept-charset=\"UTF-8\" action=\"/\" class=\"new_post\" id=\"new_post\" method=\"post\"><div style=\"margin:0;padding:0;display:inline\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /></div>&lt;input id=&quot;post_title&quot; name=&quot;post[title]&quot; type=&quot;text&quot; /&gt;</form>');}return __p.join('');};\n}).call(this);\n"
  end
end
