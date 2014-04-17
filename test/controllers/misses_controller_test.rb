require 'test_helper'

class MissesControllerTest < ActionController::TestCase
  setup do
    @miss = misses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:misses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miss" do
    assert_difference('Miss.count') do
      post :create, miss: { hours: @miss.hours, pair: @miss.pair, student_id: @miss.student_id }
    end

    assert_redirected_to miss_path(assigns(:miss))
  end

  test "should show miss" do
    get :show, id: @miss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miss
    assert_response :success
  end

  test "should update miss" do
    patch :update, id: @miss, miss: { hours: @miss.hours, pair: @miss.pair, student_id: @miss.student_id }
    assert_redirected_to miss_path(assigns(:miss))
  end

  test "should destroy miss" do
    assert_difference('Miss.count', -1) do
      delete :destroy, id: @miss
    end

    assert_redirected_to misses_path
  end
end
