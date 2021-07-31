class LikesController < ApplicationController
  def create
    @post = Micropost.find(params[:post_id])
    if @post.user_id != current_user.id   # 自分の投稿以外にお気に入り登録が可能
      @like = Like.create(user_id: current_user.id, post_id: @post.id)
    end
  end
  def destroy
    @post = Micropost.find(params[:post_id])
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
  end
end