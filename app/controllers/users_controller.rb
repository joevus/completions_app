class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :enforce_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

private

  def enforce_admin
    unless current_user.role.name == "admin"
      redirect_to root_path, notice: 'Access Denied, Admins Only'
    end
  end
end