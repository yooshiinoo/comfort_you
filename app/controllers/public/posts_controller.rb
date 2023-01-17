class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = (current_user.id)
    if @post.save
      redirect_to public_post_path(@post.id)
    else
      @posts = Post.all
      render :index
    end
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :text)
  end

end
