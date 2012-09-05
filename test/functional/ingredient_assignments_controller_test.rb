require 'test_helper'

class IngredientAssignmentsControllerTest < ActionController::TestCase
  setup do
    @ingredient_assignment = ingredient_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_assignment" do
    assert_difference('IngredientAssignment.count') do
      post :create, ingredient_assignment: @ingredient_assignment.attributes
    end

    assert_redirected_to ingredient_assignment_path(assigns(:ingredient_assignment))
  end

  test "should show ingredient_assignment" do
    get :show, id: @ingredient_assignment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_assignment.to_param
    assert_response :success
  end

  test "should update ingredient_assignment" do
    put :update, id: @ingredient_assignment.to_param, ingredient_assignment: @ingredient_assignment.attributes
    assert_redirected_to ingredient_assignment_path(assigns(:ingredient_assignment))
  end

  test "should destroy ingredient_assignment" do
    assert_difference('IngredientAssignment.count', -1) do
      delete :destroy, id: @ingredient_assignment.to_param
    end

    assert_redirected_to ingredient_assignments_path
  end
end
