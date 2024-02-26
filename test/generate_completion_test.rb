require "test_helper"
require "shiro"

class GenerateCompletionTest < Minitest::Test
  def test_create_generates_completion
    VCR.use_cassette("generate_completion_create") do
      options = {
        environment: "PRODUCTION",
        prompt_id: ENV['SHIRO_PROMT_ID'],
        input_variables: { "review_text": "I loved the movie." }
      }

      response = Shiro::GenerateCompletion.create(ENV['SHIRO_DEPLOYMENT_ID'], options)

      assert response.key?("content"), "Expected response to include 'content'"
    end
  end
end
