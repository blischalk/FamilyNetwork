require 'test_helper'

class ToolAssignmentsControllerTest < ActionController::TestCase
  setup do
    @tool_assignment = tool_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tool_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool_assignment" do
    assert_difference('ToolAssignment.count') do
      post :create, tool_assignment: @tool_assignment.attributes
    end

    assert_redirected_to tool_assignment_path(assigns(:tool_assignment))
  end

  test "should show tool_assignment" do
    get :show, id: @tool_assignment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool_assignment.to_param
    assert_response :success
  end

  test "should update tool_assignment" do
    put :update, id: @tool_assignment.to_param, tool_assignment: @tool_assignment.attributes
    assert_redirected_to tool_assignment_path(assigns(:tool_assignment))
  end

  test "should destroy tool_assignment" do
    assert_difference('ToolAssignment.count', -1) do
      delete :destroy, id: @tool_assignment.to_param
    end

    assert_redirected_to tool_assignments_path
  end
end
