require 'bundler'
Bundler.require :default, :test

require 'capybara/rspec'
require 'capybara-webkit'

require File.expand_path('../app/app.rb', __FILE__)

Mockjax.path_to_js = 'https://raw.github.com/appendto/jquery-mockjax/master/jquery.mockjax.js'

Capybara.default_driver = :webkit
Capybara.app = Rack::Builder.new {
  use Rack::Mockjax
  run Sinatra::Application
}
