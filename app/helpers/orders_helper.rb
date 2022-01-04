module OrdersHelper

    def check_already_in_cart
        #For Product
        if @order.orderable_type=="ProductVariant"
            product=ProductVariant.find(@order.orderable_id)
            #----Check if item is already in cart then increase the quantity----#
            previous_item = Order.where(orderable_id: @order.orderable_id, user_id: current_user.id, cart: true, orderable_type: @order.orderable_type)
        
            if(previous_item.length != 0)
                previous_item.update(qty: (@order.qty+previous_item[0].qty))
                redirect_to carts_index_path, notice: "Added in cart"
                return true;    
            else
                return false;
            end
        #For Service
        else    
            previous_item = Order.where(orderable_id: @order.orderable_id, user_id: current_user.id, cart: true, orderable_type: @order.orderable_type, start_time: @order.start_time, end_time: @order.end_time)
            #check if product_service is already in cart
            if(previous_item != [])
                redirect_to carts_index_path, notice: "Order is already in cart"
                return true; 
            else
                return false;
            end
        end
    end

    def add_to_cart_before_login cart
        if cart == "Add To Cart"
            redirect_to user_session_path(id: @order.orderable_id, type: @order.orderable_type, cart: "true", quantity: @order.qty,total_amount: @order.total_amount, start_time: @order.start_time, end_time: @order.end_time, date: @order.date, duration: @order.duration)
        else
            redirect_to user_session_path(id: @order.orderable_id, type: @order.orderable_type, cart: "false")
        end
    end
end
