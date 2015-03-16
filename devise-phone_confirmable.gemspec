# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/phone_confirmable/version'

Gem::Specification.new do |spec|
  spec.name          = 'devise-phone_confirmable'
  spec.version       = Devise::PhoneConfirmable::VERSION
  spec.authors       = ['Alex']
  spec.email         = ['kaburbundokel11g@inbox.ru']
  spec.summary       = %q{Phone confirmation with devise}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '4.2.0'
  spec.add_dependency 'devise'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'fabrication'
  spec.add_development_dependency 'sqlite3'
end
