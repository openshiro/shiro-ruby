require "net/http"
require "json"
require "uri"
require "shiro/version"
require "shiro/client"
require "shiro/deployment"
require "shiro/prompt"
require "shiro/generate_completion"
require "shiro/me"

module Shiro
  @config = {api_key: nil}

  class << self
    attr_accessor :config

    def configure
      yield(config)
    end
  end
end
