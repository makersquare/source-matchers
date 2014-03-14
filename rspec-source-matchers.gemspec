# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'source_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "source-matchers"
  spec.version       = SourceMatchers::VERSION
  spec.authors       = ["Gilbert"]
  spec.email         = ["gilbertbgarza@gmail.com"]
  spec.description   = %q{Custom RSpec matchers for source code}
  spec.summary       = %q{Check if your code AST includes whatever you want}
  spec.homepage      = "https://github.com/makersquare/source-matchers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.14'

  spec.add_dependency 'ruby_parser', '~> 3.4'
  spec.add_dependency 'sexp_path', '>= 0.5.1'
end
