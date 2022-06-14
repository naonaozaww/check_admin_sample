class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.order(created_at: :desc)
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: 'User was successfully updated'
    else
      flash.now[:danger] = 'Failed to update user'
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: 'User was successfully destroyed'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :role, :avatar, :avatar_cache)
  end
end
