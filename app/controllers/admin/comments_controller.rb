class Admin::CommentsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end

end
