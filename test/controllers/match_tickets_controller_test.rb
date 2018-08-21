require 'test_helper'

class MatchTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get match_tickets_create_url
    assert_response :success
  end

  test "should get new" do
    get match_tickets_new_url
    assert_response :success
  end

  test "should get edit" do
    get match_tickets_edit_url
    assert_response :success
  end

  test "should get update" do
    get match_tickets_update_url
    assert_response :success
  end

  test "should get show" do
    get match_tickets_show_url
    assert_response :success
  end

  test "should get destroy" do
    get match_tickets_destroy_url
    assert_response :success
  end

end
