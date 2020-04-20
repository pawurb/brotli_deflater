require 'rack'

class Rack::BrotliDeflater
  def initialize(app, options={})
    @app = app
    @options = options
  end

  def call(env)
    if env["HTTP_ACCEPT_ENCODING"]&.include?("br")
      @app.call(@env)
    elsif env["HTTP_ACCEPT_ENCODING"]&.include?("gzip")
      Rack::Deflater.new(@app).call(env)
    else
      @app.call(@env)
    end
  end
end
