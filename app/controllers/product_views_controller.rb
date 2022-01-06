class ProductViewsController < ApplicationController

  def create_product_view
    previous_view=ProductView.where(user_ip: params[:user_ip], viewable_id: params[:viewable_id], viewable_type: params[:viewable_type].to_s).count
    if previous_view == 0
        ProductView.create(user_ip: params[:user_ip], viewable_id: params[:viewable_id], viewable_type: params[:viewable_type].to_s)
    end
  end
    # Only allow a list of trusted parameters through.
    def product_view_params
      params.require(:product_view).permit(:viewable_id, :viewable_type, :user_ip)
    end
end
