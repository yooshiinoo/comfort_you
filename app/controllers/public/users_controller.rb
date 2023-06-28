class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @post = @user.posts
    @posts = @user.posts.reverse_order.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to about_path
  end

  def index
    @user = current_user
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
