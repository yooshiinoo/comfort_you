class Admin::HomesController < ApplicationController
  def top
    @search = Post.ransack(params[:q])
    @posts = @search.result.reverse_order.page(params[:page])
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :text)
  end

end
