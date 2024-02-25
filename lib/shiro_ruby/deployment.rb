module ShiroRuby
  class Deployment
    def self.list
      client.get("/deployments").parsed_response
    end

    def self.retrieve(id)
      client.get("/deployments/#{id}").parsed_response
    end

    private_class_method

    def self.client
      @client ||= Client.new
    end
  end
end
