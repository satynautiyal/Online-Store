class CartsController < ApplicationController

  before_action :set_order, only: %i[ show edit update destroy ]
  def index
    @cart = Order.where(user_id: current_user.id, cart: true).includes(:orderable)
  end

  def edit
  end
  
  def buy_now
    CartService.decrease_quantity_from_product_varaint(current_user.id)
    respond_to do |format|
      if Order.where(:user_id => current_user.id, :cart => 'true').update_all("cart = false")
        format.html { redirect_to orders_path, notice: I18n.t('order_created') }
        format.json { render :show, status: :ok, location: @order }
      end
    end
  end

  def update_qty
    order=Order.find(params[:order_id].to_i)
    #abort(params.to_json)
    order.update(qty: params[:quantity].to_i, total_amount: params[:amount].to_f)
    
  end

  def update_product_service
    order=Order.find(params[:order_id].to_i)
    #abort(params.to_json)
    order.update(date: params[:date].to_date,duration: params[:duration].to_i, start_time: params[:start_time], end_time: params[:end_time], total_amount: params[:total_amount].to_f)
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
