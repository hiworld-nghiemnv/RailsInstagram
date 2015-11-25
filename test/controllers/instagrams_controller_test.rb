require 'test_helper'

class InstagramsControllerTest < ActionController::TestCase
  test "should get connect" do
    get :connect
    assert_response :success
  end

  test "should get getData" do
    get :getData
    assert_response :success
  end

end
