require 'test_helper'

class Manager::IdeasControllerTest < ActionController::TestCase
  setup do
    @manager_idea = manager_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_idea" do
    assert_difference('Manager::Idea.count') do
      post :create, manager_idea: {  }
    end

    assert_redirected_to manager_idea_path(assigns(:manager_idea))
  end

  test "should show manager_idea" do
    get :show, id: @manager_idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_idea
    assert_response :success
  end

  test "should update manager_idea" do
    patch :update, id: @manager_idea, manager_idea: {  }
    assert_redirected_to manager_idea_path(assigns(:manager_idea))
  end

  test "should destroy manager_idea" do
    assert_difference('Manager::Idea.count', -1) do
      delete :destroy, id: @manager_idea
    end

    assert_redirected_to manager_ideas_path
  end
end
