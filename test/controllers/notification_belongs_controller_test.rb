require "test_helper"

class NotificationBelongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_belong = notification_belongs(:one)
  end

  test "should get index" do
    get notification_belongs_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_belong_url
    assert_response :success
  end

  test "should create notification_belong" do
    assert_difference('NotificationBelong.count') do
      post notification_belongs_url, params: { notification_belong: { notification_id: @notification_belong.notification_id, readed: @notification_belong.readed, user_id: @notification_belong.user_id } }
    end

    assert_redirected_to notification_belong_url(NotificationBelong.last)
  end

  test "should show notification_belong" do
    get notification_belong_url(@notification_belong)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_belong_url(@notification_belong)
    assert_response :success
  end

  test "should update notification_belong" do
    patch notification_belong_url(@notification_belong), params: { notification_belong: { notification_id: @notification_belong.notification_id, readed: @notification_belong.readed, user_id: @notification_belong.user_id } }
    assert_redirected_to notification_belong_url(@notification_belong)
  end

  test "should destroy notification_belong" do
    assert_difference('NotificationBelong.count', -1) do
      delete notification_belong_url(@notification_belong)
    end

    assert_redirected_to notification_belongs_url
  end
end
