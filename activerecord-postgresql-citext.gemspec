# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "activerecord-postgresql-citext"
  spec.version       = "0.2.0"
  spec.authors       = ["Braintree"]
  spec.email         = ["code@getbraintree.com"]
  spec.description   = "citext support for rails"
  spec.summary       = "citext support for rails"
  spec.homepage      = "https://github.com/braintree/activerecord-postgresql-citext"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0.0", "< 4.2.0"
  spec.add_dependency "pg"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "= 2.14.1"
end
