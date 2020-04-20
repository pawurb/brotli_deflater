require 'rack'

class Rack::BrotliDeflater
  def initialize(app, options={})
    @app = app
    @options = options
  end

  def call(env)
    if env["HTTP_ACCEPT_ENCODING"]&.include?("br")
      status, headers, body = @app.call(env)
      headers.delete(Rack::CONTENT_LENGTH)

      [
        status,
        headers.merge("Content-Encoding" => "br"),
        BrotliStream.new(body, { quality: 11 })
      ]
    elsif env["HTTP_ACCEPT_ENCODING"]&.include?("gzip")
      Rack::Deflater.new(@app).call(env)
    else
      @app.call(@env)
    end
  end

  private

  class BrotliStream
    include Rack::Utils

    def initialize(body, options)
      @body = body
      @options = options
    end

    def each(&block)
      @writer = block
      buffer = ''
      @body.each { |part|
        buffer << part
      }
      yield ::Brotli.deflate(buffer, @options)
    ensure
      @writer = nil
    end

    def close
      @body.close if @body.respond_to?(:close)
    end
  end
end
