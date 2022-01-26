class ProductViewsController < ApplicationController

  def create_product_view
    unless user_signed_in? &&(current_user.role =="admin" || current_user.role =="seller")
      previous_view=ProductView.where(user_ip: params[:user_ip], product_variant_id: params[:product_variant_id]).count
      if previous_view == 0
          ProductView.create(user_ip: params[:user_ip],product_variant_id: params[:product_variant_id])
      end
    end
  end
  
  # Only allow a list of trusted parameters through.
  def product_view_params
    params.require(:product_view).permit(:product_variant_id, :user_ip)
  end
end
