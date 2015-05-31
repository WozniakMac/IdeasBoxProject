require 'test_helper'

class Admin::VotesControllerTest < ActionController::TestCase
  setup do
    @admin_vote = admin_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_vote" do
    assert_difference('Admin::Vote.count') do
      post :create, admin_vote: {  }
    end

    assert_redirected_to admin_vote_path(assigns(:admin_vote))
  end

  test "should show admin_vote" do
    get :show, id: @admin_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_vote
    assert_response :success
  end

  test "should update admin_vote" do
    patch :update, id: @admin_vote, admin_vote: {  }
    assert_redirected_to admin_vote_path(assigns(:admin_vote))
  end

  test "should destroy admin_vote" do
    assert_difference('Admin::Vote.count', -1) do
      delete :destroy, id: @admin_vote
    end

    assert_redirected_to admin_votes_path
  end
end
