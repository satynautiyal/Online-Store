class StaticPagesController < ApplicationController
  include StaticPagesHelper
	def home
		if Category.all.length != 0 && Product.all.length != 0
			@category = Category.all
			@most_popular =  ProductView.group(:id).group(:product_variant_id).order('count(product_variant_id) DESC')
			@trending = Order.group(:id).group(:orderable_id).where(orderable_type: 
			"ProductVariant").order('count(orderable_id) DESC').order('created_at DESC')
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
			render pdf: "Analitical_data",template: "static_pages/analytical_data_pdf.html.erb",page_size: 'A4'
		end
	end

end
