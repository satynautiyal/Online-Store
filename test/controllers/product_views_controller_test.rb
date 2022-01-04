require "test_helper"

class ProductViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_view = product_views(:one)
  end

  test "should get index" do
    get product_views_url
    assert_response :success
  end

  test "should get new" do
    get new_product_view_url
    assert_response :success
  end

  test "should create product_view" do
    assert_difference('ProductView.count') do
      post product_views_url, params: { product_view: { user_ip: @product_view.user_ip, viewable_id: @product_view.viewable_id, viewable_type: @product_view.viewable_type } }
    end

    assert_redirected_to product_view_url(ProductView.last)
  end

  test "should show product_view" do
    get product_view_url(@product_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_view_url(@product_view)
    assert_response :success
  end

  test "should update product_view" do
    patch product_view_url(@product_view), params: { product_view: { user_ip: @product_view.user_ip, viewable_id: @product_view.viewable_id, viewable_type: @product_view.viewable_type } }
    assert_redirected_to product_view_url(@product_view)
  end

  test "should destroy product_view" do
    assert_difference('ProductView.count', -1) do
      delete product_view_url(@product_view)
    end

    assert_redirected_to product_views_url
  end
end
