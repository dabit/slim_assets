ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'fileutils'
FileUtils.mkdir_p("./spec/rails_app/tmp/cache/")

require 'rails_app/config/environment'
require 'slim_assets'
require 'ejs'
require 'rspec/rails'
require 'active_record'

Rails.cache.clear

ActiveRecord::Base.
  establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define(:version => 0) do
  create_table "posts", :force => true do |t|
    t.string "title"
  end
end

