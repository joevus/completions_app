class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :enforce_admin, only: [:index, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)

    render :show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end

private

  def enforce_admin
    unless current_user.role.name == "admin"
      redirect_to root_path, notice: 'Access Denied, Admins Only'
    end
  end

  def update_params
    params.require(:user).permit(:role_id)
  end
end