require 'test_helper'

class DeptsControllerTest < ActionController::TestCase
  setup do
    @dept = depts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:depts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dept" do
    assert_difference('Dept.count') do
      post :create, dept: { name: @dept.name }
    end

    assert_redirected_to dept_path(assigns(:dept))
  end

  test "should show dept" do
    get :show, id: @dept
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dept
    assert_response :success
  end

  test "should update dept" do
    patch :update, id: @dept, dept: { name: @dept.name }
    assert_redirected_to dept_path(assigns(:dept))
  end

  test "should destroy dept" do
    assert_difference('Dept.count', -1) do
      delete :destroy, id: @dept
    end

    assert_redirected_to depts_path
  end
end
