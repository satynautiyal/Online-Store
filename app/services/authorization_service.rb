class AuthorizationService
    def self.after_sign_in_add_to_cart(user,cart)
        cart[:user_id] = user
        if(cart['orderable_type']== "ProductService")
                already_in_cart = Order.where("user_id = #{user} AND orderable_type = '#{cart['orderable_type']}' AND orderable_id = #{cart['orderable_id']} AND start_time == ? AND end_time == ? AND date == ? AND cart = true",cart['start_time'].to_time,cart['end_time'].to_time,cart['date'].to_date)
        else
                already_in_cart = Order.where("user_id = #{user} AND orderable_type = '#{cart['orderable_type']}' AND orderable_id = #{cart['orderable_id']} AND cart = true")
        end
        if(already_in_cart.length == 0)
                Order.new(cart).save
        end
    end
end