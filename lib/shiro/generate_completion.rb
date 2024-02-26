module Shiro
  class GenerateCompletion
    def self.create(deployment_id, options = {})
      body = {
        deployment_id: deployment_id,
        environment: options[:environment],
        prompt_id: options[:prompt_id],
        input_variables: options[:input_variables]
      }.compact

      response = client.post("/generate_completion", body)
      response.parsed_response
    end

    private

    def self.client
      @client ||= Client.new
    end

    private_class_method :client
  end
end
