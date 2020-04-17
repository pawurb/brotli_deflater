# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brotli_deflater/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-brotli-deflater"
  gem.version       = BrotliDeflater::VERSION
  gem.authors       = ["pawurb"]
  gem.email         = ["contact@pawelurbanek.com"]
  gem.summary       = %q{ Brotli Gzip Deflater Middleware }
  gem.description   = %q{ Brotli Gzip Deflater Middleware }
  gem.homepage      = "http://github.com/pawurb/brotli_deflater"
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = gem.files.grep(%r{^(test)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "byebug"
  gem.add_development_dependency "test-unit"
end
