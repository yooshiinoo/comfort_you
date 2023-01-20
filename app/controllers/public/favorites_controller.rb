class Public::FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.post_id = @post.id
    @favorite.save
    redirect_to public_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    redirect_to public_post_path(@post)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :post_id)
  end


end
