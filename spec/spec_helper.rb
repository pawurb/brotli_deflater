require 'rubygems'
require 'bundler/setup'
require 'rack/test'
require 'byebug'
require_relative '../lib/rack/brotli_deflater/main'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def dbg msg
  p '!!!!!!!!!!!!!!!'
  p msg
  p '!!!!!!!!!!!!!!!'
end

class Object
  alias_method :bb, :byebug
end

