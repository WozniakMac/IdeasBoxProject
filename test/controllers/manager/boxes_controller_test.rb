require 'test_helper'

class Manager::BoxesControllerTest < ActionController::TestCase
  setup do
    @manager_box = manager_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_box" do
    assert_difference('Manager::Box.count') do
      post :create, manager_box: {  }
    end

    assert_redirected_to manager_box_path(assigns(:manager_box))
  end

  test "should show manager_box" do
    get :show, id: @manager_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_box
    assert_response :success
  end

  test "should update manager_box" do
    patch :update, id: @manager_box, manager_box: {  }
    assert_redirected_to manager_box_path(assigns(:manager_box))
  end

  test "should destroy manager_box" do
    assert_difference('Manager::Box.count', -1) do
      delete :destroy, id: @manager_box
    end

    assert_redirected_to manager_boxes_path
  end
end
