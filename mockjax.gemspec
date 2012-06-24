# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mockjax/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eric J. Holmes"]
  gem.email         = ["eric@ejholmes.net"]
  gem.description   = %q{Ruby gem for using jquery mockjax within rspec examples}
  gem.summary       = %q{Ruby gem for using jquery mockjax within rspec examples}
  gem.homepage      = "https://github.com/ejholmes/mockjax"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mockjax"
  gem.require_paths = ["lib"]
  gem.version       = Mockjax::VERSION

  gem.add_dependency 'rack'
end
