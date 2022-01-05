class ProductServices::CartsController < CartsController
    before_action :set_cart_item
    private
    def set_cart_item
        @cart_item = ProductService.find(params[:product_service_id])
    end
end