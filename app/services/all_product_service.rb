class AllProductService
  def self.product_index(category,current_user)
    if Category.all.length !=0 && Product.all.length !=0
      if category != nil
        @from_category = category
        @products = AllProductService.all_product_variant_by_category(@from_category)
      else
        if !current_user.nil? && current_user.role =="admin"
          @products = Product.all.order('created_at DESC')
        elsif !current_user.nil? && current_user.role =="seller"
          seller_products = current_user.products.kept.order('created_at DESC')
          if seller_products != nil
            @products = seller_products
          end
        else
          @heading="Shop By Brand"
          @products = Product.kept.order('created_at DESC')
        end
      end
		end
    return @products,@heading
  end

  #Fetch Products By Category
  def self.all_product_variant_by_category category_name
    (Category.find_by_name category_name).products.order('created_at DESC')
  end
end