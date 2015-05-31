require 'test_helper'

class Admin::BoxesControllerTest < ActionController::TestCase
  setup do
    @admin_box = admin_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_box" do
    assert_difference('Admin::Box.count') do
      post :create, admin_box: {  }
    end

    assert_redirected_to admin_box_path(assigns(:admin_box))
  end

  test "should show admin_box" do
    get :show, id: @admin_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_box
    assert_response :success
  end

  test "should update admin_box" do
    patch :update, id: @admin_box, admin_box: {  }
    assert_redirected_to admin_box_path(assigns(:admin_box))
  end

  test "should destroy admin_box" do
    assert_difference('Admin::Box.count', -1) do
      delete :destroy, id: @admin_box
    end

    assert_redirected_to admin_boxes_path
  end
end
