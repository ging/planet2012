require 'test_helper'

class PlanetControllerTest < ActionController::TestCase
 test "should get index" do
	get :index # Invoca "get" en acción "index"
	assert_response :success # código HTTP: "200 OK"
 end
 test "should get contact" do
	get :contact # Invoca "get" en acción "contact"
	assert_response :success # código HTTP: "200 OK"
 end
 test "should get ejemplo" do
	get :ejemplo # Invoca "get" en acción "ejemplo"
	assert_response :success # código HTTP: "200 OK"
 end
 test "should get authors" do
	get :authors # Invoca "get" en acción "authors"
	assert_response :success # código HTTP: "200 OK"
 end

end
