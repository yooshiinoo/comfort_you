class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :first_name, :email, :is_deleted)
  end

end
