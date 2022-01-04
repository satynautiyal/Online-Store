require "application_system_test_case"

class NotificationBelongsTest < ApplicationSystemTestCase
  setup do
    @notification_belong = notification_belongs(:one)
  end

  test "visiting the index" do
    visit notification_belongs_url
    assert_selector "h1", text: "Notification Belongs"
  end

  test "creating a Notification belong" do
    visit notification_belongs_url
    click_on "New Notification Belong"

    fill_in "Notification", with: @notification_belong.notification_id
    check "Readed" if @notification_belong.readed
    fill_in "User", with: @notification_belong.user_id
    click_on "Create Notification belong"

    assert_text "Notification belong was successfully created"
    click_on "Back"
  end

  test "updating a Notification belong" do
    visit notification_belongs_url
    click_on "Edit", match: :first

    fill_in "Notification", with: @notification_belong.notification_id
    check "Readed" if @notification_belong.readed
    fill_in "User", with: @notification_belong.user_id
    click_on "Update Notification belong"

    assert_text "Notification belong was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification belong" do
    visit notification_belongs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification belong was successfully destroyed"
  end
end
