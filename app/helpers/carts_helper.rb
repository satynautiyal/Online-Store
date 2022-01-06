module CartsHelper

    def decrease_quantity_from_product_varaint
        #----Decrease quantity from product table--------#
        Order.where(:user_id => current_user.id, :cart => 'true').each do |order|
            if order.orderable_type == "ProductVariant"
                product=ProductVariant.find(order.orderable_id)
                product.update(quantity: (product.quantity-order.qty))
            end
        end 
    end

end
