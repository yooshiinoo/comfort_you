class Public::FavoritesController < ApplicationController
  def index
  end
  
  def create
    @post = Post.find(params[:post_id])
    @favorite = Favorite.new(comment_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to public_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorite.find_by(post_id: post.id)
    @favorite.destroy
    redirect_to public_post_path(@post)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :post_id)
  end
  
end
