require 'test_helper'

class ProviderAlertsControllerTest < ActionController::TestCase
  setup do
    @provider_alert = provider_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_alert" do
    assert_difference('ProviderAlert.count') do
      post :create, provider_alert: { alert_text: @provider_alert.alert_text, client_id_id: @provider_alert.client_id_id, provider_id_id: @provider_alert.provider_id_id }
    end

    assert_redirected_to provider_alert_path(assigns(:provider_alert))
  end

  test "should show provider_alert" do
    get :show, id: @provider_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_alert
    assert_response :success
  end

  test "should update provider_alert" do
    patch :update, id: @provider_alert, provider_alert: { alert_text: @provider_alert.alert_text, client_id_id: @provider_alert.client_id_id, provider_id_id: @provider_alert.provider_id_id }
    assert_redirected_to provider_alert_path(assigns(:provider_alert))
  end

  test "should destroy provider_alert" do
    assert_difference('ProviderAlert.count', -1) do
      delete :destroy, id: @provider_alert
    end

    assert_redirected_to provider_alerts_path
  end
end
