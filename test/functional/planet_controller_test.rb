require 'test_helper'

class PlanetControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get search" do
    get(:search, {'q' => 'Text'})
    assert_response :success
  end

end
