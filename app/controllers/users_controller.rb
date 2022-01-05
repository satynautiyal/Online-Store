class UsersController < ApplicationController
  before_action :set_user, only: %i[ show soft_destroy destroy ]
  def index
      @users=User.all
      authorize current_user
  end

  def show
    authorize @user
  end

  # SOFT DELETE User
  def soft_destroy
    User.deleted_user_notification()
    User.soft_delete_user_products(@user.id)
    authorize @user
    @user.discard
    sign_out_and_redirect(@user)
    flash[:alert] = I18n.t('user_destroyed')
  end

  def destroy
      authorize @user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to user_index _url, notice: I18n.t('user_destroyed') }
        format.json { head :no_content }
      end
    end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
    
end
