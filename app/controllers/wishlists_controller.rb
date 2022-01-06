class WishlistsController < ApplicationController
include WishlistsHelper
# GET /wishlists or /wishlists.json
def index
  wishlist_product()
end

#Add to Wishlist
def add_to_wishlist
  Wishlist.create(product_variant_id: params[:product_variant_id], user_id: params[:user_id])
end

#Remove from Wishlist
def remove_from_wishlist
  destroy_wishlist()
end

# DELETE /wishlists/1 or /wishlists/1.json
def destroy_wishlisted_product
  destroy_wishlist()
  respond_to do |format|
    format.html { redirect_to wishlists_url, notice: I18n.t('wishlist_destroyed') }
    format.json { head :no_content }
  end
end
end
