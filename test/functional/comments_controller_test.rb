require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @update = {   # @update:  parametros diferentes
      :comment => 'AnotherComment',
      :site_id => sites(:one).id
    }
    @site = @comment.site
    @user = @comment.user
    sign_in @user
  end

  test "should get index" do
    get :index, :site_id => @comment.to_param
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new, :site_id => @comment.to_param
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: @update
    end

    assert_redirected_to @site
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment, comment: @update
    assert_redirected_to @site
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to @site
  end
end
