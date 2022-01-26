class UsersController < ApplicationController
  before_action :set_user, only: %i[ show soft_destroy destroy ]
  def index
      @users=User.all.order('created_at DESC')
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
    if current_user.id == @user.id
      sign_out_and_redirect(@user)
    else
      redirect_to users_path
    end
    flash[:alert] = I18n.t('user_destroyed')
  end

  def restore_soft_deleted
    user_id = params[:id]
    User.where(id: user_id).update(discarded_at: nil)
    redirect_to users_path
  end

  def destroy
      authorize @user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: I18n.t('user_destroyed') }
        format.json { head :no_content }
      end
    end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
    
end
