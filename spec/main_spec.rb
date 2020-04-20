require 'spec_helper'

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

  let(:base_env) do
    {
      "REQUEST_METHOD" => "GET",
      "PATH_INFO" => "/test"
    }
  end

  let(:response) do
    get "/test"
  end

  describe "gzip encoding" do
    let(:env) do
      base_env.merge({

      })
    end

    it "returns the correct headers" do
      expect(response.headers).not_to be_nil
    end
  end
end
