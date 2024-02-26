require "test_helper"
require "shiro"

class GenerateCompletionTest < Minitest::Test
  def test_create_generates_completion
    VCR.use_cassette("generate_completion_create") do
      deployment_id = "dpmt_o6drBgMEZv9YmU9vYjb5QwxR"
      options = {
        environment: "PRODUCTION",
        prompt_id: "prmt_6q9JKvEmp5LPxub5ONgawnrB",
        input_variables: { "review_text": "I loved the movie." }
      }

      response = Shiro::GenerateCompletion.create(deployment_id, options)

      assert response.key?("content"), "Expected response to include 'content'"
    end
  end
end
