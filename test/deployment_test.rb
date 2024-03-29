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
      response = Shiro::Deployment.retrieve(ENV['SHIRO_DEPLOYMENT_ID'])

      assert_equal ENV['SHIRO_DEPLOYMENT_ID'], response["id"]
      assert response.key?("name")
      assert response.key?("environment_type")
    end
  end

  def test_update_deployment_name
    VCR.use_cassette("deployment_update") do
      new_name = "Updated Deployment Name"

      response = Shiro::Deployment.update(ENV['SHIRO_DEPLOYMENT_ID'], {name: new_name})

      assert_equal new_name, response["name"], "Expected the deployment's name to be updated"
    end
  end
end
