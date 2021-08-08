class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @user = User.find_by(id: current_user.id)
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to homes_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'homes/index'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    if current_user && current_user.already_liked?(@micropost)
      @like = Like.where(user_id: current_user.id, micropost_id: @micropost.id)
    else
      @like = Like.new
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || homes_url

  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
  
end
