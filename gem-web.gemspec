# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem/web/version'

Gem::Specification.new do |spec|
  spec.name          = "gem-web"
  spec.version       = Gem::Web::VERSION
  spec.authors       = ["Bodo Tasche"]
  spec.email         = ["bodo@wannawork.de"]
  spec.summary       = %q{Adds a web command for gem}
  spec.description   = %q{Open the webpage, documentation or github page of a gem}
  spec.homepage      = "http://github.com/bitboxer/gem-web"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "launchy", "~> 2.4.2"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

end
