$:.push File.expand_path("../lib", __FILE__)
require 'trebbianno/version'

Gem::Specification.new do |spec|
  spec.name          = "trebbianno-ruby-api"
  spec.version       = Trebbianno::VERSION
  spec.authors       = ["Justin Grubbs"]
  spec.email         = ["justin@sellect.com"]
  spec.description   = %q{Ruby Library for Trebbianno Fulfillment API}
  spec.summary       = %q{This is a library for interfacing with the Trebbianno Fulfillment API}
  spec.homepage      = "http://sellect.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "builder"
  spec.add_dependency "xml-simple"

  spec.add_development_dependency "hashie"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "debugger"
end
