class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :text)
  end

end
