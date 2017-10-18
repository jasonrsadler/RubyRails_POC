require 'test_helper'

class SiteProceedsControllerTest < ActionController::TestCase
  setup do
    @site_proceed = site_proceeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_proceeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_proceed" do
    assert_difference('SiteProceed.count') do
      post :create, site_proceed: { client_id: @site_proceed.client_id, commission_amount: @site_proceed.commission_amount, commission_percentage: @site_proceed.commission_percentage, counseling_session_id: @site_proceed.counseling_session_id, provider_amount: @site_proceed.provider_amount, provider_id: @site_proceed.provider_id, total_session_amount: @site_proceed.total_session_amount }
    end

    assert_redirected_to site_proceed_path(assigns(:site_proceed))
  end

  test "should show site_proceed" do
    get :show, id: @site_proceed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_proceed
    assert_response :success
  end

  test "should update site_proceed" do
    patch :update, id: @site_proceed, site_proceed: { client_id: @site_proceed.client_id, commission_amount: @site_proceed.commission_amount, commission_percentage: @site_proceed.commission_percentage, counseling_session_id: @site_proceed.counseling_session_id, provider_amount: @site_proceed.provider_amount, provider_id: @site_proceed.provider_id, total_session_amount: @site_proceed.total_session_amount }
    assert_redirected_to site_proceed_path(assigns(:site_proceed))
  end

  test "should destroy site_proceed" do
    assert_difference('SiteProceed.count', -1) do
      delete :destroy, id: @site_proceed
    end

    assert_redirected_to site_proceeds_path
  end
end
