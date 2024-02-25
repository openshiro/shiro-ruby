require "test_helper"
require "shiro_ruby"

class DeploymentTest < Minitest::Test
  def setup
    ShiroRuby.configure do |config|
      config[:api_key] = ENV["SHIRO_API_KEY"]
    end
  end

  def test_list_deployments
    VCR.use_cassette("deployments_list") do
      response = ShiroRuby::Deployment.list
      assert response.first.has_key?("id"), "Expected first deployment to have an 'id'"
      assert response.first.has_key?("name"), "Expected first deployment to have a 'name'"
      # Add more assertions as needed based on the expected structure of a deployment
    end
  end

  def test_retrieve_deployment
    VCR.use_cassette("deployment_retrieve") do
      deployment_id = ShiroRuby::Deployment.list.first["id"]
      response = ShiroRuby::Deployment.retrieve(deployment_id)

      assert_equal deployment_id, response["id"]
      assert response.key?("name")
      assert response.key?("environment_type")
    end
  end
end
