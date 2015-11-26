require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get hashtag" do
    get :hashtag
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
