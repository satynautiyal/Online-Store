class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update soft_destroy destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    authorize @categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    authorize @category
  end

  # GET /categories/new
  def new
    @category = Category.new
    authorize @category
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    authorize @category
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: I18n.t('category_created') }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    authorize @category
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: I18n.t('category_updated') }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # SOFT DELETE User
  def soft_destroy
    authorize @category
    @category.discard
    respond_to do |format|
      format.html { redirect_to categories_url, notice: I18n.t('product_destroyed') }
      format.json { head :no_content }
    end
  end
  
  # DELETE /categories/1 or /categories/1.json
  def destroy
    authorize @category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: I18n.t('category_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :category_of)
    end
end
