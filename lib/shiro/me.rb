module Shiro
  class Me
    def self.retrieve
      response = client.get("/me")
      response.parsed_response
    end

    def self.delete
      response = client.delete("/me")
      response.parsed_response
    end

    private

    def self.client
      @client ||= Client.new
    end

    private_class_method :client
  end
end
