require 'test_helper'

class Manager::CommentsControllerTest < ActionController::TestCase
  setup do
    @manager_comment = manager_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_comment" do
    assert_difference('Manager::Comment.count') do
      post :create, manager_comment: {  }
    end

    assert_redirected_to manager_comment_path(assigns(:manager_comment))
  end

  test "should show manager_comment" do
    get :show, id: @manager_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_comment
    assert_response :success
  end

  test "should update manager_comment" do
    patch :update, id: @manager_comment, manager_comment: {  }
    assert_redirected_to manager_comment_path(assigns(:manager_comment))
  end

  test "should destroy manager_comment" do
    assert_difference('Manager::Comment.count', -1) do
      delete :destroy, id: @manager_comment
    end

    assert_redirected_to manager_comments_path
  end
end
