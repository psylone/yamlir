# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yamlir/version'

Gem::Specification.new do |spec|
  spec.name          = "yamlir"
  spec.version       = YAMLir::VERSION
  spec.authors       = ["Evgeniy Fateev"]
  spec.email         = ["spaceflow@gmail.com"]
  spec.description   = %q{Create YAML file (commonly named yamlir.yml) with folders content.}
  spec.summary       = %q{Generate folder structure in YAML format.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
