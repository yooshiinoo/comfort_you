class Public::Users::SessionsController < ApplicationController

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to public_posts_path
  end

end
