require 'rack'
require 'rspec'

require 'mockjax/version'
require 'mockjax/rails'
require 'mockjax/rack'

module Mockjax
  class << self
    def mock(options)
      mocks << options
    end

    def mocks
      @mocks ||= []
    end

    def cleanup
      @mocks = []
    end

    def path_to_js=(path)
      @path_to_js = path
    end

    def path_to_js
      @path_to_js || begin
        if defined?(::Rails)
          '/assets/jquery.mockjax.js'
        else
          'https://raw.github.com/appendto/jquery-mockjax/master/jquery.mockjax.js'
        end
      end
    end
  end

  # RSpec helper
  module Helpers
    def mockjax(*args)
      Mockjax.mock(*args)
    end
    alias :stub_ajax :mockjax
  end
end

RSpec.configure do |config|
  config.include Mockjax::Helpers, :type => :feature

  config.after(:each) do
    Mockjax.cleanup
  end
end
