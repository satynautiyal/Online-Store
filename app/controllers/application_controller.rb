class ApplicationController < ActionController::Base
    include Pagy::Backend
    #devise
    protect_from_forgery with: :exception
     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end

         #pundit
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

          private
        
          def user_not_authorized
            flash[:alert] = "You are not authorized to perform this action."
            redirect_to(request.referrer || root_path)
          end   
     
     #Add items to cart after sign in 
     def after_sign_in_path_for(resource)
          if session[:cart] != nil
               #BuyNow
               if session[:cart]['cart'] == "false"
                    if session[:cart]['orderable_type'] == "ProductVariant"
                         ProductVariant.find(session[:cart]['orderable_id'])
                    else
                         ProductService.find(session[:cart]['orderable_id'])
                    end
               #Add To Cart
               else
                    session[:cart][:user_id] = current_user.id
                    if(session[:cart]['orderable_type']== "ProductService")
                         already_in_cart = Order.where("user_id = #{current_user.id} AND orderable_type = '#{session[:cart]['orderable_type']}' AND orderable_id = #{session[:cart]['orderable_id']} AND start_time == ? AND end_time == ? AND date == ? AND cart = true",session[:cart]['start_time'].to_time,session[:cart]['end_time'].to_time,session[:cart]['date'].to_date)
                    else
                         already_in_cart = Order.where("user_id = #{current_user.id} AND orderable_type = '#{session[:cart]['orderable_type']}' AND orderable_id = #{session[:cart]['orderable_id']} AND cart = true")
                    end
                    if(already_in_cart.length == 0)
                         Order.new(session[:cart]).save
                    end
                    session.delete(:cart)
                    carts_index_url
               end
          else
               root_url
          end
     end
end
