require 'test_helper'

class PlanetControllerTest < ActionController::TestCase
setup do
	@busqueda = "MyString"
end
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

   test "should get ejemplo" do
    get :ejemplo
    assert_response :success
  end

  test "should get author" do
    get :author
    assert_response :success
  end

  test "should get search" do
      get :search, busqueda: @busqueda
      assert_response :success
  end
end