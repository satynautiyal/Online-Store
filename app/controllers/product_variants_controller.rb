class ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: %i[ show edit update soft_destroy destroy ]

  # GET /product_variants/1 or /product_variants/1.json
  def show
  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new
    authorize @product_variant
  end

  # GET /product_variants/1/edit
  def edit
    authorize @product_variant
  end

  # POST /product_variants or /product_variants.json
  def create
    @product_variant = ProductVariant.new(product_variant_params)
    @product_variant.user_id=current_user.id
    authorize @product_variant
    respond_to do |format|
      if @product_variant.save
        format.html { redirect_to @product_variant, notice: I18n.t('product_variant_created') }
        format.json { render :show, status: :created, location: @product_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_variants/1 or /product_variants/1.json
  def update
    authorize @product_variant
    respond_to do |format|
      if @product_variant.update(product_variant_params)
        format.html { redirect_to @product_variant, notice: I18n.t('product_variant_updated')  }
        format.json { render :show, status: :ok, location: @product_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # SOFT DELETE /product_variants/1 or /product_variants/1.json
  def soft_destroy
    authorize @product_variant
    @product_variant.discard
    respond_to do |format|
      format.html { redirect_to @product_variant.product, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end

  # Restore soft deleted product_variant
  def restore_soft_deleted
    product_variant_id = params[:id]
    ProductVariant.where(id: product_variant_id).update(discarded_at: nil)
    redirect_to ProductVariant.find(product_variant_id).product
  end

  # DELETE /product_variants/1 or /product_variants/1.json
  def destroy
    authorize @product_variant
    @product_variant.destroy
    respond_to do |format|
      format.html { redirect_to @product_variant.product, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_variant_params
      params.require(:product_variant).permit(:batch_no, :weight, :price, :quantity, :expiry, :product_id, :discarded_at, :remove_main_image, :main_image, other_images: [])
    end
end
