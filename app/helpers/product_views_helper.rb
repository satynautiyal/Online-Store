module ProductViewsHelper
    def product_name(product_variant)
        Product.find(product_variant.product_id).name
    end
end
