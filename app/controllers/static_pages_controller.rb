class StaticPagesController < ApplicationController
  include StaticPagesHelper
	def home
		if Category.all.length != 0 && Product.all.length != 0
			@electronics = product_by_category("Electronics")
			@men_fashion = product_by_category("Men's Fashion")
			@women_fashion = product_by_category("Women's Fashion")
			@watches = product_by_category("Watch")
			@mobile = product_by_category("Mobile")
			@most_popular =  ProductView.group(:id).group(:viewable_id).order('count(viewable_id) DESC')
			@trending = Order.group(:id).group(:orderable_id).where(orderable_type: 
			"ProductVariant").order('count(orderable_id) DESC').order('created_at DESC')
		end
	end

end
