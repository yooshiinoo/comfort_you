class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to public_comment_path(@comment.id)
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end

end
