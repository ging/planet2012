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

  test "should get author" do
	  get :author
	  # Invoca “get” en acción “author”
	  assert_response :success # código HTTP: “200 OK”
  end

  test "should get ejemplo" do
	  get :ejemplo
	  # Invoca “get” en acción “ejemplo”
	  assert_response :success # código HTTP: “200 OK”
  end

end
