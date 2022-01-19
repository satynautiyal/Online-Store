class NotificationBelongsController < ApplicationController
  before_action :set_notification_belong, only: %i[ show edit update destroy ]

  # GET /notification_belongs or /notification_belongs.json
  def index
    @notification_belongs = NotificationBelong.all
  end

  #Update Table after reading notification
  def after_read
    NotificationBelong.where(notification_id: params[:notification_id].to_i, user_id: params[:user_id].to_i).update(readed: 1)
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
