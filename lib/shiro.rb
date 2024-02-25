require "net/http"
require "json"
require "uri"
require "shiro/client"
require "shiro/deployment"
require "shiro/version"

module Shiro
  @config = {api_key: nil}

  class << self
    attr_accessor :config

    def configure
      yield(config)
    end
  end
end
