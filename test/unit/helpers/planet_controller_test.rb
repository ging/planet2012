require 'test_helper'

class PlanetControllerTest < ActionController::TestCase

  test "index_test" do
    get :index
    assert_response :success
  end
  
  test "contact_test" do
    get :contact
    assert_response :success
  end

  test "ejemplo_test" do
    get :ejemplo
    assert_response :success
  end
  
  test "author_test" do
    get :author
    assert_response :success
  end

end
