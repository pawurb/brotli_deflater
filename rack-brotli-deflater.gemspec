# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "rack-brotli-deflater"
  gem.version       = '0.0.1'
  gem.authors       = ["pawurb"]
  gem.email         = ["contact@pawelurbanek.com"]
  gem.summary       = %q{ Brotli Gzip Deflater Middleware }
  gem.description   = %q{ Brotli Gzip Deflater Middleware }
  gem.homepage      = "http://github.com/pawurb/brotli_deflater"
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_runtime_dependency 'rack'
  gem.add_runtime_dependency 'brotli', '0.2.3'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "byebug"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack-test"

end
