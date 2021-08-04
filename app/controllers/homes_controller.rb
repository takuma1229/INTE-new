class HomesController < ApplicationController

  def index
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      redirect_to sessions_url
    end
  end
end