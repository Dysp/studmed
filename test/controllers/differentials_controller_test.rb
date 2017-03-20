require 'test_helper'

class DifferentialsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get differentials_create_url
    assert_response :success
  end

  test "should get destroy" do
    get differentials_destroy_url
    assert_response :success
  end

end
