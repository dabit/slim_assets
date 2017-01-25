require 'spec_helper'

class Post < ActiveRecord::Base
end

describe SlimAssets do
  it "should have the proper format" do
    expect(RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s).to match /<h1><div class=\"text\">Render works<\/div><\/h1>/
  end

  it "should use rails helpers" do
    render = RailsApp::Application.assets['helpers.jst.ejs.slim'].to_s
    [
      /<form/,
      /<input/,
      /'<h1>Form<\/h1>/,
      /id=&quot;post_title&quot;/,
      /post\[title\]/
    ].each do |regexp|
      expect(render).to match(regexp)
    end

  end

  it "should use application helpers" do
    expect(RailsApp::Application.assets['app_helpers.jst.ejs.slim'].to_s).to match /<h1>App helpers work<\/h1>/
  end
end
