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
               #If clicked on BuyNow button without sign in
               if session[:cart]['cart'] == "false"
                    #It will redirect back to the Same Product/Service after sign in
                    session[:cart]['orderable_type'].constantize.find(session[:cart]['orderable_id'])
               #If clicked on Add To Cart button without sign in
               else
                    AuthorizationService.after_sign_in_add_to_cart(current_user.id, session[:cart])
                    session.delete(:cart)
                    carts_index_url
               end
          else
               root_url
          end
     end
        
end
