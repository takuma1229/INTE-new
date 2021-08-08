class LikesController < ApplicationController
  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    # binding.pry
    @like = current_user.likes.create(micropost_id: params[:micropost_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find_by(id: params[:micropost_id])
    @like = Like.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end
end