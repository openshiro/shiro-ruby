require "test_helper"
require "shiro"

class PromptTest < Minitest::Test
  def test_list_prompts
    VCR.use_cassette("prompts_list") do
      response = Shiro::Prompt.list
      assert response.first.has_key?("id"), "Expected first prompt to have an 'id'"
      assert response.first.has_key?("name"), "Expected first prompt to have a 'name'"
      # Add more assertions based on the expected structure of a prompt
    end
  end

  def test_retrieve_prompt
    VCR.use_cassette("prompt_retrieve") do
      response = Shiro::Prompt.retrieve(ENV['SHIRO_PROMPT_ID'])

      assert_equal ENV['SHIRO_PROMPT_ID'], response["id"]
      assert response.key?("name"), "Expected prompt to have a 'name'"
      assert response.key?("body"), "Expected prompt to have a 'body'"
      # Add more assertions based on the expected structure of a prompt
    end
  end
end
