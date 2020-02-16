require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Card cvv", with: @user.card_cvv
    fill_in "Card expiration", with: @user.card_expiration
    fill_in "Card name", with: @user.card_name
    fill_in "Card num", with: @user.card_num
    fill_in "Cart", with: @user.cart
    fill_in "City", with: @user.city
    fill_in "Dob", with: @user.dob
    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "State", with: @user.state
    fill_in "Street address", with: @user.street_address
    fill_in "Wishlist", with: @user.wishlist
    fill_in "Zip", with: @user.zip
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Card cvv", with: @user.card_cvv
    fill_in "Card expiration", with: @user.card_expiration
    fill_in "Card name", with: @user.card_name
    fill_in "Card num", with: @user.card_num
    fill_in "Cart", with: @user.cart
    fill_in "City", with: @user.city
    fill_in "Dob", with: @user.dob
    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "State", with: @user.state
    fill_in "Street address", with: @user.street_address
    fill_in "Wishlist", with: @user.wishlist
    fill_in "Zip", with: @user.zip
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
