# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riksteatern/version'

Gem::Specification.new do |spec|
  spec.name          = "riksteatern"
  spec.version       = Riksteatern::VERSION
  spec.authors       = ["Peter Hellberg"]
  spec.email         = ["peter@c7.se"]
  spec.summary       = %q{Ruby client for the Riksteatern API}
  spec.homepage      = "https://github.com/peterhellberg/riksteatern"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
