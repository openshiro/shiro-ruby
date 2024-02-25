require "net/http"
require "json"
require "uri"
require "shiro_ruby/client"
require "shiro_ruby/deployment"
require "shiro_ruby/version"

module ShiroRuby
  @config = {api_key: nil}

  class << self
    attr_accessor :config

    def configure
      yield(config)
    end
  end
end
