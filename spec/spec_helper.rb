require 'bundler'
Bundler.require :default, :test

require 'capybara/rspec'
require 'capybara-webkit'

require File.expand_path('../app/app.rb', __FILE__)

Capybara.default_driver = :webkit
Capybara.app = Rack::Builder.new {
  use Rack::Mockjax
  run Sinatra::Application
}
