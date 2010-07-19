require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'factory_girl'
  require "fakeweb"
  
  # I dont want to hammer the server
  FakeWeb.allow_net_connect = false
  FakeWeb.register_uri :get, "http://www.mynewsdesk.com/partner/api/1_0/a9e6a7533e996a5c2a3275d5b393a4b0/channel/290/material/test_list", :body => open('spec/fixtures/list.xml')
  
  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
  
  RSpec.configure do |config|
    config.mock_with :mocha
    config.use_transactional_fixtures = true
  end
  
  
end

Spork.each_run do
  
end
