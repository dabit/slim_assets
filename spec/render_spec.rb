require 'spec_helper'

class Post < ActiveRecord::Base
end

describe SlimAssets do
  it "should have the proper format" do
    RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s.should match /<h1><div class=\"text\">Render works</div></h1>/
  end

  it "should use rails helpers" do
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /<form/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /<input/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /'<h1>Form<\/h1>/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /id=&quot;post_title&quot;/
    RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s.should match /post\[title\]/
  end

  it "should use application helpers" do
    RailsApp::Application.assets['app_helpers.jst.ejs.slim'].to_s.should match /<h1>App helpers work<\/h1>/
  end
end
