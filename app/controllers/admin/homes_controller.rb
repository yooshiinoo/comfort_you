class Admin::HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page])
  end
  
  private
  def post_params
    params.require(:customer).permit(:user_id, :text)
  end
  
end
