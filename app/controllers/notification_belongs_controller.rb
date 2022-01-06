class NotificationBelongsController < ApplicationController
  before_action :set_notification_belong, only: %i[ show edit update destroy ]

  # GET /notification_belongs or /notification_belongs.json
  def index
    @notification_belongs = NotificationBelong.all
  end

  # GET /notification_belongs/1 or /notification_belongs/1.json
  def show
  end

  # GET /notification_belongs/new
  def new
    @notification_belong = NotificationBelong.new
  end

  # GET /notification_belongs/1/edit
  def edit
  end

  # POST /notification_belongs or /notification_belongs.json
  def create
    @notification_belong = NotificationBelong.new(notification_belong_params)

    respond_to do |format|
      if @notification_belong.save
        format.html { redirect_to @notification_belong, notice: I18n.t('notification_belong_created') }
        format.json { render :show, status: :created, location: @notification_belong }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification_belong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_belongs/1 or /notification_belongs/1.json
  def update
    respond_to do |format|
      if @notification_belong.update(notification_belong_params)
        format.html { redirect_to @notification_belong, notice: I18n.t('notification_belong_updated')}
        format.json { render :show, status: :ok, location: @notification_belong }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification_belong.errors, status: :unprocessable_entity }
      end
    end
  end

  #Update Table after reading notification
  def after_read
    NotificationBelong.where("notification_id=#{params[:notification_id].to_i} AND user_id=#{params[:user_id].to_i}").update(readed: 1)
  end

  # DELETE /notification_belongs/1 or /notification_belongs/1.json
  def destroy
    @notification_belong.destroy
    respond_to do |format|
      format.html { redirect_to notification_belongs_url, notice: I18n.t('notification_belong_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_belong
      @notification_belong = NotificationBelong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_belong_params
      params.require(:notification_belong).permit(:readed, :user_id, :notification_id)
    end
end
