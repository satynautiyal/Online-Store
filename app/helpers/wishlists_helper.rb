module WishlistsHelper
   def destroy_wishlist
        Wishlist.where("product_variant_id = #{params[:product_variant_id]} AND user_id = #{params[:user_id]}").destroy_all
   end

   def wishlist_product
        @wishlists = Wishlist.where("user_id = #{current_user.id}")
        @wishlists.each do |wishlist| 
        if defined? @wishlist_data 
        @wishlist_data = wishlist.product_variant_id.to_s+","+@wishlist_data 
        else 
        @wishlist_data = wishlist.product_variant_id.to_s 
        end 
        end 
        @wishlist_product = ProductVariant.where("id in(#{@wishlist_data})")
   end
end
