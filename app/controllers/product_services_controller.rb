class ProductServicesController < ApplicationController
  before_action :set_product_service, only: %i[ show edit update soft_destroy destroy ]

  # GET /product_services or /product_services.json
  def index
    if user_signed_in? && current_user.role == "admin"
      @product_services = ProductService.all
    elsif user_signed_in? && current_user.role == "seller"
      @product_services = ProductService.kept.find_by_user_id current_user.id
    else
      @product_services = ProductService.kept
    end
  end

  # GET /product_services/1 or /product_services/1.json
  def show
  end
  
  # ElasticSearch
  def search
    unless params[:query].blank?
      @results = ProductService.search(params[:query])
    end
  end
  # GET /product_services/new
  def new
    @product_service = ProductService.new
    authorize @product_service
  end

  # GET /product_services/1/edit
  def edit
    authorize @product_service
  end

  # POST /product_services or /product_services.json
  def create
    @product_service = ProductService.new(product_service_params)
    @product_service.user_id=current_user.id
    authorize @product_service
    respond_to do |format|
      if @product_service.save
        format.html { redirect_to @product_service, notice: I18n.t('product_service_created') }
        format.json { render :show, status: :created, location: @product_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_services/1 or /product_services/1.json
  def update
    authorize @product_service
    respond_to do |format|
      if @product_service.update(product_service_params)
        format.html { redirect_to @product_service, notice: I18n.t('product_service_updated') }
        format.json { render :show, status: :ok, location: @product_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_service.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # SOFT DELETE product_service
  def soft_destroy
    authorize @product_service
    @product_service.discard
    respond_to do |format|
      format.html { redirect_to product_services_url, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end

  # Restore soft deleted product_service
  def restore_soft_deleted
    product_service_id = params[:id]
    ProductService.where(id: product_service_id).update(discarded_at: nil)
    redirect_to product_services_path
  end

  # DELETE /product_services/1 or /product_services/1.json
  def destroy
    authorize @product_service
    @product_service.destroy
    respond_to do |format|
      format.html { redirect_to product_services_url, notice: I18n.t('product_service_destroyed')  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_service
      @product_service = ProductService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_service_params
      params.require(:product_service).permit(:name, :category_id, :description, :duration, :start_time, :end_time, :price, orders_attributes: [:time])
    end
end
