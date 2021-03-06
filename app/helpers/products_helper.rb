module ProductsHelper
    #Fetch Products By Category
    def all_product_variant_by_category category_name
        (Category.includes(:products).find_by_name category_name).products.includes(:product_variants).order('created_at DESC')
    end
end
