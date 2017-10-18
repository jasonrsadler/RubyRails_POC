require 'test_helper'

class ProceedsControllerTest < ActionController::TestCase
  setup do
    @proceed = proceeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proceeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceed" do
    assert_difference('Proceed.count') do
      post :create, proceed: { amount: @proceed.amount, provider_id: @proceed.provider_id }
    end

    assert_redirected_to proceed_path(assigns(:proceed))
  end

  test "should show proceed" do
    get :show, id: @proceed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceed
    assert_response :success
  end

  test "should update proceed" do
    patch :update, id: @proceed, proceed: { amount: @proceed.amount, provider_id: @proceed.provider_id }
    assert_redirected_to proceed_path(assigns(:proceed))
  end

  test "should destroy proceed" do
    assert_difference('Proceed.count', -1) do
      delete :destroy, id: @proceed
    end

    assert_redirected_to proceeds_path
  end
end
