class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update soft_destroy destroy ]
  include ProductsHelper
  # GET /products or /products.json
  def index
    if Category.all.length !=0 && Product.all.length !=0
      if params[:category] != nil
        @from_category = params[:category]
        @pagy,@products = pagy(all_product_variant_by_category(@from_category))
      else
        if user_signed_in? and current_user.role =="admin"
          @pagy,@products = pagy(Product.all)
        else
          @pagy,@products = pagy(Product.kept)
        end
      end
		end
  end

  # GET /products/1 or /products/1.json
  def show
    if user_signed_in? and current_user.role =="admin"
      @pagy,@product_variants = pagy(ProductVariant.where(product_id: @product.id))
    else
      @pagy,@product_variants = pagy(ProductVariant.where(product_id: @product.id).kept)
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
    @product.product_variants.build
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id=current_user.id
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: I18n.t('product_created') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    authorize @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: I18n.t('product_updated') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # SOFT DELETE /products/1 or /products/1.json
  def soft_destroy
    authorize @product
    @product.discard
    respond_to do |format|
      format.html { redirect_to products_url, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    # authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:id, :category_id, :name, :code, :description, :price, :quantity, :remove_main_image, :main_image, product_variants_attributes: [:batch_no, :weight, :price, :quantity, :expiry, :products_id,:user_id, :remove_main_image, :main_image, other_images: []])
    end
end
