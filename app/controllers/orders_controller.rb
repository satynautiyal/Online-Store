class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders= OrderService.order_index(current_user.id, current_user.role)
  end

  # GET /orders/1 or /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order_no#{@order.id}",template: "orders/order_pdf.html.erb",page_size: 'A4'
      end
    end
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
      @order.user_id = OrderService.check_if_user_signed_in_else_redirect_to_login(current_user.id, params[:cart],@order)
    else
      redirect, session[:cart] = OrderService.check_if_user_signed_in_else_redirect_to_login("not_signed_in", params[:cart],@order)
      redirect_to eval("#{redirect}"), notice: I18n.t('sign_in_first')      
      return
    end
      order, notice, redirect= OrderService.create_order(params[:cart],current_user.id,@order)
      respond_to do |format|
        if order.save
          format.html { redirect_to eval("#{redirect}"), notice: notice }
          format.json { render :show, status: :created, location: order }
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


