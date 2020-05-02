require 'test_helper'

class PurchaseHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_history = purchase_histories(:one)
  end

  test "should get index" do
    get purchase_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_history_url
    assert_response :success
  end

  test "should create purchase_history" do
    assert_difference('PurchaseHistory.count') do
      post purchase_histories_url, params: { purchase_history: {  } }
    end

    assert_redirected_to purchase_history_url(PurchaseHistory.last)
  end

  test "should show purchase_history" do
    get purchase_history_url(@purchase_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_history_url(@purchase_history)
    assert_response :success
  end

  test "should update purchase_history" do
    patch purchase_history_url(@purchase_history), params: { purchase_history: {  } }
    assert_redirected_to purchase_history_url(@purchase_history)
  end

  test "should destroy purchase_history" do
    assert_difference('PurchaseHistory.count', -1) do
      delete purchase_history_url(@purchase_history)
    end

    assert_redirected_to purchase_histories_url
  end
end
