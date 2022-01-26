class StaticPagesController < ApplicationController
  include StaticPagesHelper
	def home
		if Category.all.length != 0 && Product.all.length != 0
			@category = Category.where(category_of: "product")
			unless  user_signed_in? && (current_user.role == "admin" || current_user.role == "seller")
				@most_popular =  ProductVariant.includes(:main_image_attachment).includes(:product).where(id: ProductView.select(:product_variant_id).group(:product_variant_id).order('COUNT(product_variant_id) DESC')).uniq
				@trending = Order.includes(:orderable).where(orderable_type: "ProductVariant").order('created_at DESC').all.map{|p| p.orderable if p.orderable.kept?}.uniq		
			end
		end
	end

	def sales_graph_data
		respond_to do |format|
			format.js {render layout: false} # Add this line to you respond_to block
		end
	end

	def users_graph_data
		respond_to do |format|
			format.js {render layout: false} # Add this line to you respond_to block
		end
	end

	def sales_tabular_data
		respond_to do |format|
			format.js {render layout: false} # Add this line to you respond_to block
		end
	end

	def sales_analytical_data_pdf
		if params[:format] ="pdf"
			render pdf: "Analitical_data",template: "static_pages/sales_analytical_data_pdf.html.erb",page_size: 'A4'
		end
	end

end
