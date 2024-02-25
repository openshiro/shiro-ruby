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

      assert response.key?("deployments")
      assert response["deployments"].is_a?(Array)
    end
  end

  def test_retrieve_deployment
    VCR.use_cassette("deployment_retrieve") do
      deployment_id = "dpmt_lWokJnPAwQCeV2ZWovjG7BNr"
      response = ShiroRuby::Deployment.retrieve(deployment_id)

      assert_equal deployment_id, response["id"]
      assert response.key?("name")
      assert response.key?("environment_type")
    end
  end
end
