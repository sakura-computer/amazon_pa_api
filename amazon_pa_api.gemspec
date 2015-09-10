# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amazon_pa_api/version'

Gem::Specification.new do |spec|
  spec.name          = "amazon_pa_api"
  spec.version       = AmazonPaApi::VERSION
  spec.authors       = ["sakura-computer"]
  spec.email         = ["ishimoto.masaru@sakura-computer.co.jp"]

  spec.summary       = %q{For Amazon Product Advertiseing API.}
  spec.description   = %q{The purpose of this gem is to make use of Amazon Product Advertising API and pull easily Amazon products information.}
  spec.homepage      = "https://github.com/sakura-computer/amazon_pa_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "accessor_extender", "~> 1.0"
end
