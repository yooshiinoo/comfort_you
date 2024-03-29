class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to comment_path(@comment.id)
    else
      redirect_to posts_path
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end

end
