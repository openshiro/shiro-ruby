require "httparty"

module Shiro
  class Client
    include HTTParty
    base_uri "https://openshiro.com/api/v1"

    def initialize(api_key = ENV["SHIRO_API_KEY"])
      raise "API key not defined" unless api_key
      @api_key = api_key
    end

    def get(path)
      self.class.get(path, headers: auth_header)
    end

    def post(path, body = {})
      self.class.post(path, body: body.to_json, headers: auth_header.merge("Content-Type" => "application/json"))
    end

    def delete(path)
      self.class.delete(path, headers: auth_header)
    end

    private

    def auth_header
      {"Authorization" => "Bearer #{@api_key}"}
    end
  end
end
