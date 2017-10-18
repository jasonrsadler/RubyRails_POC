require 'test_helper'

class ClientReceiptsControllerTest < ActionController::TestCase
  setup do
    @client_receipt = client_receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_receipt" do
    assert_difference('ClientReceipt.count') do
      post :create, client_receipt: {  }
    end

    assert_redirected_to client_receipt_path(assigns(:client_receipt))
  end

  test "should show client_receipt" do
    get :show, id: @client_receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_receipt
    assert_response :success
  end

  test "should update client_receipt" do
    patch :update, id: @client_receipt, client_receipt: {  }
    assert_redirected_to client_receipt_path(assigns(:client_receipt))
  end

  test "should destroy client_receipt" do
    assert_difference('ClientReceipt.count', -1) do
      delete :destroy, id: @client_receipt
    end

    assert_redirected_to client_receipts_path
  end
end
