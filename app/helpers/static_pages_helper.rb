module StaticPagesHelper
    #Fetch Products By Category
    def product_by_category category_name
        (Category.includes(:products).find_by_name category_name).products.limit(10)
    end
end
