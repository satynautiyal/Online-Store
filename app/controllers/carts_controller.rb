class CartsController < ApplicationController
  include CartsHelper
  #To update data with js_file otherwise it will give error for authencity token as we are calling update query from js file
  #skip_forgery_protection

  before_action :set_order, only: %i[ show edit update destroy ]
  def index
    @cart = Order.where(user_id: current_user.id, cart: true)
  end

  def edit
  end
  
  def buy_now
    decrease_quantity_from_product_varaint()
    respond_to do |format|
      if Order.where(:user_id => current_user.id, :cart => 'true').update_all("cart = false")
        format.html { redirect_to orders_path, notice: I18n.t('order_created') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
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
