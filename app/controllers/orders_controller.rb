class OrdersController < ApplicationController
  
  include OrdersHelper
  #To update data with js_file otherwise it will give error for authencity token as we are calling update query from js file
  #skip_forgery_protection

  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.where(user_id: current_user)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

def time_slot
         respond_to do |format|
             format.js {render layout: false} # Add this line to you respond_to block
         end
end
  # POST /orders or /orders.json
  def create
    @order = @orderable.orders.new(order_params)
    if defined? current_user.id
      @order.user_id = current_user.id
    else
      add_to_cart_before_login(params[:cart])
      return
    end
    if params[:cart]=="Add To Cart"
        if check_already_in_cart() == false
          @order.cart=1
          respond_to do |format|
              if @order.save
                format.html { redirect_to carts_index_path, notice: I18n.t('add_cart') }
                format.json { render :show, status: :created, location: @order }
              end
          end
        end
    else
      @order.cart=0
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: I18n.t('order_created') }
          format.json { render :show, status: :created, location: @order }
        end
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: I18n.t('order_updated') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to carts_index_url, notice: I18n.t('order_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:orderable_id, :orderable_type, :total_amount, :qty, :start_time, :end_time, :date, :duration)
    end
end


