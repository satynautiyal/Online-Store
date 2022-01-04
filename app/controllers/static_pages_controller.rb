class StaticPagesController < ApplicationController
    include StaticPagesHelper
    def home
        @electronics = product_by_category("Electronic")
        @men_fashion = product_by_category("Men's Fashion")
        @women_fashion = product_by_category("Women's Fashion")
        @watches = product_by_category("Watch")
        @mobile = product_by_category("Mobile")
        @most_popular =  ProductView.group(:viewable_id).order('count(viewable_id) DESC')
        @trending = Order.group(:orderable_id).where(orderable_type: "ProductVariant").order('count(orderable_id) DESC').order('created_at DESC')
    end
end
