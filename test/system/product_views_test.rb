require "application_system_test_case"

class ProductViewsTest < ApplicationSystemTestCase
  setup do
    @product_view = product_views(:one)
  end

  test "visiting the index" do
    visit product_views_url
    assert_selector "h1", text: "Product Views"
  end

  test "creating a Product view" do
    visit product_views_url
    click_on "New Product View"

    fill_in "User ip", with: @product_view.user_ip
    fill_in "Viewable", with: @product_view.viewable_id
    fill_in "Viewable type", with: @product_view.viewable_type
    click_on "Create Product view"

    assert_text "Product view was successfully created"
    click_on "Back"
  end

  test "updating a Product view" do
    visit product_views_url
    click_on "Edit", match: :first

    fill_in "User ip", with: @product_view.user_ip
    fill_in "Viewable", with: @product_view.viewable_id
    fill_in "Viewable type", with: @product_view.viewable_type
    click_on "Update Product view"

    assert_text "Product view was successfully updated"
    click_on "Back"
  end

  test "destroying a Product view" do
    visit product_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product view was successfully destroyed"
  end
end
