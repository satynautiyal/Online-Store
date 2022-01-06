class PaymentController < ApplicationController
    @data
    def create_payment
        $data=params
        @session = Stripe::Checkout::Session.create({
                payment_method_types: ['card'],
                line_items: [{
                name: params[:name],
                amount:  params[:amount].to_i*100,
                quantity: params[:quantity],
                currency: 'inr',
            }],
            mode: 'payment',
            success_url: payment_order_place_url,
            cancel_url: payment_payment_failed_url,
        })
        respond_to do |format|
            format.js
        end
    end

    def order_place
        if($data['cart']=="true")
            redirect_to carts_buy_now_path
        else
            @order={"orderable_id": $data['id'],"total_amount": $data['amount'],"start_time": $data['start_time'],"end_time": $data['end_time'],"qty": $data['quantity'],"user_id": current_user.id,"cart": 0,"date": $data['date'],"orderable_type": $data['orderable_type'],"duration": $data['duration']}
            @order_place=Order.new(@order)
            if @order_place.save
                ActionCable.server.broadcast("order_place_notification_channel", { content: "A user buy a "+@order_place.orderable_type })
                respond_to do |format|
                    format.html { redirect_to @order_place, notice: I18n.t('order_created') }
                    format.json { render :show, status: :created, location: @order_place }
                end
            end
        end
    end

    def payment_failed
        @order={"orderable_id": $data['id'],"total_amount": $data['amount'],"start_time": $data['start_time'],"end_time": $data['end_time'],"qty": $data['quantity'],"user_id": current_user.id,"cart": 0,"date": $data['date'],"orderable_type": $data['orderable_type'],"duration": $data['duration']}
        @order_place=Order.new(@order)
        if @order_place.save
            respond_to do |format|
                format.html { redirect_to @order_place, notice: I18n.t('payment_failed') }
                format.json { render :show, status: :created, location: @order_place }
            end
        end
    end
    
end