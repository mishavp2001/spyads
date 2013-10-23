require 'test_helper'

class IxsellControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get query" do
    get :query
    assert_response :success
  end

end
