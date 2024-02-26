module Shiro
  class Deployment
    def self.list
      client.get("/deployments").parsed_response
    end

    def self.retrieve(id)
      client.get("/deployments/#{id}").parsed_response
    end

    def self.client
      @client ||= Client.new
    end

    private_class_method :client
  end
end
