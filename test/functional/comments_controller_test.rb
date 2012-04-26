require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :redirect
    
  end

  test "should get new" do
    get :new
    assert_response :redirect
  end

  test "should create comment" do
    
      post :create, comment: @comment.attributes
   

    assert_response :redirect
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :redirect
  end

  test "should update comment" do
    put :update, id: @comment, comment: @comment.attributes
    assert_response :redirect
  end

  test "should destroy comment" do
	delete :destroy, id: @comment
    

    assert_response :redirect
  end
end
