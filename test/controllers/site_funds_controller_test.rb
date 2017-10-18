require 'test_helper'

class SiteFundsControllerTest < ActionController::TestCase
  setup do
    @site_fund = site_funds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_funds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_fund" do
    assert_difference('SiteFund.count') do
      post :create, site_fund: { avail_amount: @site_fund.avail_amount }
    end

    assert_redirected_to site_fund_path(assigns(:site_fund))
  end

  test "should show site_fund" do
    get :show, id: @site_fund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_fund
    assert_response :success
  end

  test "should update site_fund" do
    patch :update, id: @site_fund, site_fund: { avail_amount: @site_fund.avail_amount }
    assert_redirected_to site_fund_path(assigns(:site_fund))
  end

  test "should destroy site_fund" do
    assert_difference('SiteFund.count', -1) do
      delete :destroy, id: @site_fund
    end

    assert_redirected_to site_funds_path
  end
end
