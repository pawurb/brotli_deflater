require 'spec_helper'
require 'stringio'
require 'brotli'

describe Rack::BrotliDeflater do
  let(:base_app) do
    -> (env) {
      [
        200,
        { "Content-Type" => "text/plain" },
        ["Hello World\n"]
      ]
    }
  end

  let(:app) do
    Rack::BrotliDeflater.new(base_app, options)
  end

  let(:options) do
    {}
  end

  let(:response) do
    get "/test", nil, headers
  end

  describe "gzip encoding" do
    let(:headers) do
      {
        "HTTP_ACCEPT_ENCODING" => "gzip, deflate"
      }
    end

    it "returns the correct headers" do
      expect(response.headers.fetch("Content-Encoding")).to eq "gzip"
    end

    it "response is gzip encoded" do
      decompressed = Zlib::GzipReader.new(
        StringIO.new(response.body.to_s)
      ).read
      expect(decompressed).to eq "Hello World\n"
    end
  end

  describe "brotli encoding" do
    let(:headers) do
      {
        "HTTP_ACCEPT_ENCODING" => "gzip, deflate, br"
      }
    end

    it "returns the correct headers" do
      expect(response.headers.fetch("Content-Encoding")).to eq "br"
    end

    it "response is brotli encoded" do
      decompressed = Brotli.inflate(response.body.to_s)
      expect(decompressed).to eq "Hello World\n"
    end
  end
end
