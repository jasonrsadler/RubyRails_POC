require 'test_helper'

class CounselingSessionsControllerTest < ActionController::TestCase
  setup do
    @counseling_session = counseling_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counseling_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counseling_session" do
    assert_difference('CounselingSession.count') do
      post :create, counseling_session: { client: @counseling_session.client, provider: @counseling_session.provider }
    end

    assert_redirected_to counseling_session_path(assigns(:counseling_session))
  end

  test "should show counseling_session" do
    get :show, id: @counseling_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @counseling_session
    assert_response :success
  end

  test "should update counseling_session" do
    patch :update, id: @counseling_session, counseling_session: { client: @counseling_session.client, provider: @counseling_session.provider }
    assert_redirected_to counseling_session_path(assigns(:counseling_session))
  end

  test "should destroy counseling_session" do
    assert_difference('CounselingSession.count', -1) do
      delete :destroy, id: @counseling_session
    end

    assert_redirected_to provider_counseling_sessions_path
  end
end
