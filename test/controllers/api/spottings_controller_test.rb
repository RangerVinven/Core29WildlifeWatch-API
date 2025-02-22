require "test_helper"

class Api::SpottingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_spottings_index_url
    assert_response :success
  end

  test "should get show" do
    get api_spottings_show_url
    assert_response :success
  end

  test "should get create" do
    get api_spottings_create_url
    assert_response :success
  end

  test "should get update" do
    get api_spottings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_spottings_destroy_url
    assert_response :success
  end
end
