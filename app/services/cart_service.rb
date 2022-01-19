class CartService
    include Rails.application.routes.url_helpers
    def self.decrease_quantity_from_product_varaint(user)
        #----Decrease quantity from product table--------#
        Order.where(:user_id => user, :cart => 'true').each do |order|
            if order.orderable_type == "ProductVariant"
                product=ProductVariant.find(order.orderable_id)
                product.update(quantity: (product.quantity-order.qty))
            end
        end 
    end

    def self.check_already_in_cart(user,order)
        #For Product
        if order.orderable_type=="ProductVariant"
            product=ProductVariant.find(order.orderable_id)
            #----Check if item is already in cart then increase the quantity----#
            previous_item = Order.where(orderable_id: order.orderable_id, user_id: user, cart: true, orderable_type: order.orderable_type)
            notice = I18n.t('add_cart')
            if(previous_item.length != 0)
                previous_item.update(qty: (order.qty+previous_item[0].qty))
                return true, notice, order;    
            else
                return false, notice, order;
            end
        #For Service
        else    
            previous_item = Order.where(orderable_id: order.orderable_id, user_id: user, cart: true, orderable_type: order.orderable_type, start_time: order.start_time, end_time: order.end_time)
            #check if product_service is already in cart
            if(previous_item != [])
                notice = I18n.t('already_in_cart')
                return true, notice; 
            else
                return false;
            end
        end
    end

end