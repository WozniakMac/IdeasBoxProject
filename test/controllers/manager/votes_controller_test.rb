require 'test_helper'

class Manager::VotesControllerTest < ActionController::TestCase
  setup do
    @manager_vote = manager_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_vote" do
    assert_difference('Manager::Vote.count') do
      post :create, manager_vote: {  }
    end

    assert_redirected_to manager_vote_path(assigns(:manager_vote))
  end

  test "should show manager_vote" do
    get :show, id: @manager_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_vote
    assert_response :success
  end

  test "should update manager_vote" do
    patch :update, id: @manager_vote, manager_vote: {  }
    assert_redirected_to manager_vote_path(assigns(:manager_vote))
  end

  test "should destroy manager_vote" do
    assert_difference('Manager::Vote.count', -1) do
      delete :destroy, id: @manager_vote
    end

    assert_redirected_to manager_votes_path
  end
end
