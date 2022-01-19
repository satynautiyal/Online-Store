class OrderService
    
    def self.create_order(pressed_button,user,order)
        if order.orderable_type = "ProductVariant"
            order.qty > order.orderable.quantity
            notice = "We do'nt have that much quantity"
            redirection_path = "product_variant_path(id: #{order.orderable_id})"
            return order, notice, redirection_path
        end
        if pressed_button=="Add To Cart"
            redirection_path = "carts_index_path"
            check_already_in_cart, notice, order = CartService.check_already_in_cart(user,order)
              if  check_already_in_cart == false
                order.cart=1
                return order, notice, redirection_path
              else
                return order, notice, redirection_path
              end
        else
        order.cart=0
        notice = I18n.t('order_created')
        redirection_path = order
        return order,notice, redirection_path 
        end
    end

    def self.check_if_user_signed_in_else_redirect_to_login(user,cart,order)
        if user != "not_signed_in"
            return user
        else
            if cart == "Add To Cart"
                session_cart ={orderable_id: order.orderable_id, orderable_type: order.orderable_type, qty: order.qty,start_time: order.start_time, end_time: order.end_time,cart: "true", date: order.date,duration: order.duration, total_amount: order.total_amount } 
            else
                session_cart ={orderable_id: order.orderable_id, orderable_type: order.orderable_type,cart: "false"} 
            end
        end
        return  redirect = "user_session_path", session_cart
    end
end