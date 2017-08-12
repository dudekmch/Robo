require 'test_helper'

class AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adresses_new_url
    assert_response :success
  end

  test "should get create" do
    get adresses_create_url
    assert_response :success
  end

  test "should get show" do
    get adresses_show_url
    assert_response :success
  end

  test "should get edit" do
    get adresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get adresses_update_url
    assert_response :success
  end

end
