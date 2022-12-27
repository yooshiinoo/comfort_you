class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
    @user = User.find(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, ::email, :is_deleted)
  end

end
