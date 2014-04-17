require 'test_helper'

class PairsControllerTest < ActionController::TestCase
  setup do
    @pair = pairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pair" do
    assert_difference('Pair.count') do
      post :create, pair: { subject_id: @pair.subject_id, today: @pair.today }
    end

    assert_redirected_to pair_path(assigns(:pair))
  end

  test "should show pair" do
    get :show, id: @pair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pair
    assert_response :success
  end

  test "should update pair" do
    patch :update, id: @pair, pair: { subject_id: @pair.subject_id, today: @pair.today }
    assert_redirected_to pair_path(assigns(:pair))
  end

  test "should destroy pair" do
    assert_difference('Pair.count', -1) do
      delete :destroy, id: @pair
    end

    assert_redirected_to pairs_path
  end
end
