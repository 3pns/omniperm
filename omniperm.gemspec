# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniperm/version'

Gem::Specification.new do |s|
  s.name = %q{omniperm}
  s.version = Omniperm::VERSION
  s.authors = ['Samuel Bohn']
  s.email         = %w(samuel@hydrodigit.com)
  s.date = %q{2020-07-21}
  s.description = %q{With Omniperm you can centralize your authorization strategies in a YAML file against a configurable context }
  s.summary = 'Flexible Authorization for Ruby or Rails'
  s.homepage = 'https://github.com/3pns/omniperm'
  s.license = 'MIT'
  s.files = [
    "lib/omniperm.rb"
  ]
  s.require_paths = ["lib"]

  s.add_development_dependency 'minitest', "~> 5.0"
  s.add_development_dependency 'minitest-sprint'
  s.add_development_dependency 'rails'
end
