require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    check "Age restricted" if @item.age_restricted
    fill_in "Brand", with: @item.brand
    fill_in "Category", with: @item.category
    fill_in "Cost", with: @item.cost
    fill_in "Description", with: @item.description
    fill_in "Image", with: @item.image
    fill_in "Name", with: @item.name
    fill_in "Quantity", with: @item.quantity
    check "Special item" if @item.special_item
    fill_in "Tax slab", with: @item.tax_slab
    fill_in "Unique", with: @item.unique_id
    fill_in "Views count", with: @item.views_count
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    check "Age restricted" if @item.age_restricted
    fill_in "Brand", with: @item.brand
    fill_in "Category", with: @item.category
    fill_in "Cost", with: @item.cost
    fill_in "Description", with: @item.description
    fill_in "Image", with: @item.image
    fill_in "Name", with: @item.name
    fill_in "Quantity", with: @item.quantity
    check "Special item" if @item.special_item
    fill_in "Tax slab", with: @item.tax_slab
    fill_in "Unique", with: @item.unique_id
    fill_in "Views count", with: @item.views_count
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
