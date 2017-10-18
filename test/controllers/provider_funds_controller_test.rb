require 'test_helper'

class ProviderFundsControllerTest < ActionController::TestCase
  setup do
    @provider_fund = provider_funds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_funds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_fund" do
    assert_difference('ProviderFund.count') do
      post :create, provider_fund: {  }
    end

    assert_redirected_to provider_fund_path(assigns(:provider_fund))
  end

  test "should show provider_fund" do
    get :show, id: @provider_fund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_fund
    assert_response :success
  end

  test "should update provider_fund" do
    patch :update, id: @provider_fund, provider_fund: {  }
    assert_redirected_to provider_fund_path(assigns(:provider_fund))
  end

  test "should destroy provider_fund" do
    assert_difference('ProviderFund.count', -1) do
      delete :destroy, id: @provider_fund
    end

    assert_redirected_to provider_funds_path
  end
end
