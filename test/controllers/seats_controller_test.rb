require 'test_helper'

class SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get seats_create_url
    assert_response :success
  end

  test "should get new" do
    get seats_new_url
    assert_response :success
  end

end
