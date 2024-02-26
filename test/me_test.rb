require "test_helper"
require "shiro"

class MeTest < Minitest::Test
  def test_retrieve_current_user_details
    VCR.use_cassette("me_retrieve") do
      response = Shiro::Me.retrieve
      assert response.key?("id"), "Expected response to include 'id'"
    end
  end

  def test_delete_current_user_account
    VCR.use_cassette("me_delete") do
      response = Shiro::Me.delete
      assert response.empty? || response.key?("message"), "Expected successful deletion message or empty response"
    end
  end
end
