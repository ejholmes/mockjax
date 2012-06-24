require 'rack'
require 'rspec'

require 'mockjax/version'
require 'mockjax/rails'
require 'mockjax/rack'

module Mockjax
  class << self
    def mock(options)
      @mocks ||= []
      @mocks << options
    end

    def mocks
      @mocks || []
    end

    def cleanup
      @mocks = []
    end

    def path_to_js=(path)
      @path_to_js = path
    end

    def path_to_js
      @path_to_js || (defined?(::Rails) ? '/assets/jquery.mockjax.js' : 'https://raw.github.com/appendto/jquery-mockjax/master/jquery.mockjax.js')
    end
  end

  # RSpec helper
  module Helpers
    def mockjax(*args)
      Mockjax.mock(*args)
    end
  end
end

RSpec.configure do |config|
  config.include Mockjax::Helpers

  config.after(:each) do
    Mockjax.cleanup
  end
end
