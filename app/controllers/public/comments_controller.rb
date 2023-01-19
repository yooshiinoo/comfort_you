class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to public_comment_path(@comment.id)
  end

  def show

  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end

end
