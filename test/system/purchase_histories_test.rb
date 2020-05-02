require "application_system_test_case"

class PurchaseHistoriesTest < ApplicationSystemTestCase
  setup do
    @purchase_history = purchase_histories(:one)
  end

  test "visiting the index" do
    visit purchase_histories_url
    assert_selector "h1", text: "Purchase Histories"
  end

  test "creating a Purchase history" do
    visit purchase_histories_url
    click_on "New Purchase History"

    click_on "Create Purchase history"

    assert_text "Purchase history was successfully created"
    click_on "Back"
  end

  test "updating a Purchase history" do
    visit purchase_histories_url
    click_on "Edit", match: :first

    click_on "Update Purchase history"

    assert_text "Purchase history was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase history" do
    visit purchase_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase history was successfully destroyed"
  end
end
