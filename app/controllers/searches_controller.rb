class SearchesController < ApplicationController
  before_action :set_search, only: %i[ show edit update destroy ]

  # GET /searches or /searches.json
  def index
    ProductService.reindex
    Product.reindex
    query=params[:query]
    if query != nil && params[:category] != ""
      where_data={category_id: params[:category], discarded_at: nil}
      results = search_result(query, where_data)
      @pagy, @searches = pagy_searchkick(results, items: 10)
    elsif query != nil 
      where_data={discarded_at: nil}
      results = search_result(query, where_data)
      @pagy, @searches = pagy_searchkick(results, items: 10)
    end
  end

  # GET /searches/1 or /searches/1.json
  def show
  end

  def search_result(query, where_data)
    results = Searchkick.pagy_search(query, where: where_data.to_hash, models: [ProductService, Product], fields: ['name^5','description'],match: :word_middle)
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches or /searches.json
  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: "Search was successfully created." }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1 or /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: "Search was successfully updated." }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1 or /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: "Search was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.fetch(:search, {})
    end
end
