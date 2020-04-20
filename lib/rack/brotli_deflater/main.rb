require 'rack'

class Rack::BrotliDeflater
  def initialize(app, options={})
    @app = app
    @options = options
  end

  def call(env)
    dbg env
    @app.call(env)
  end
end
