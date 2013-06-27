# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kuromi/version'

Gem::Specification.new do |spec|
  spec.name          = "kuromi"
  spec.version       = Kuromi::VERSION
  spec.authors       = ["Matt House"]
  spec.email         = ["matt@eightbitraptor.com"]
  spec.description   = %q{Kuromi is an application runner}
  spec.summary       = %q{Kuromi provides a DSL for running command lines in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
