require 'test_helper'

class TableControllerTest < ActionController::TestCase
  test "should get ideas" do
    get :ideas
    assert_response :success
  end

  test "should get boxes" do
    get :boxes
    assert_response :success
  end

end
