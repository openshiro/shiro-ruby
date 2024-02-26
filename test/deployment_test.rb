require "test_helper"
require "shiro"

class DeploymentTest < Minitest::Test
  def test_list_deployments
    VCR.use_cassette("deployments_list") do
      response = Shiro::Deployment.list
      assert response.first.has_key?("id"), "Expected first deployment to have an 'id'"
      assert response.first.has_key?("name"), "Expected first deployment to have a 'name'"
      # Add more assertions as needed based on the expected structure of a deployment
    end
  end

  def test_retrieve_deployment
    VCR.use_cassette("deployment_retrieve") do
      deployment_id = Shiro::Deployment.list.first["id"]
      response = Shiro::Deployment.retrieve(deployment_id)

      assert_equal deployment_id, response["id"]
      assert response.key?("name")
      assert response.key?("environment_type")
    end
  end
end
