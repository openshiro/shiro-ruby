module Shiro
  class Prompt
    def self.list
      client.get("/prompts").parsed_response
    end

    def self.retrieve(id)
      client.get("/prompts/#{id}").parsed_response
    end

    private

    def self.client
      @client ||= Client.new
    end

    private_class_method :client
  end
end
