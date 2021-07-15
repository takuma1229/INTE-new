class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def signup_jp
    @user = User.new
  end
  
  def after_signup
    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # @user.send_activation_email
      #log_in @user
      flash[:info] = "Please check your email to activate your account."
      # redirect_to after_signup_path
      #redirect_to new_detail_path
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # def details
  # end
  
  # def details_create
  #   @user = User.find_by(id: current_user.id)
  #   # binding.pry
  #   @detail = @user.build_detail(detail_params)
  #   if @detail.save
  #     redirect_to "/users/#{@detail.user_id}"
  #   else
  #     render 'details'
  #   end
  # end
  
  def edit
    @user = User.find(params[:id])
    @detail = Detail.find_by(user_id: @user.id )
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @detail = Detail.find_by(user_id: @user.id)
    #binding.pry
    if @user.update(user_params) && @user.detail.update(detail_params)
      if @user.save && @user.detail.save
      redirect_to @user
      end
    else
      flash[:danger] = "Invalid information is included."
      render 'edit'
    end
  end
    
  
  # def edit_email edit_emailcontrollerに移行した
  #   @user = User.find(params[:id])
  # end

  
  def edit_password
    @user = User.find(params[:id])
  end
  
  def delete
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted. Thank you so much for using INTE!"
    redirect_to root_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  

  
  
  
  private
  
    def user_params #strong parameterのネスト化実装
      params.require(:user).permit(
        :name, 
        :email, 
        :image, 
        :password, 
        :password_confirmation #,
          )
    end
    # .merge(user_id: User.find_by(id: params[:id]).id) #これはつけた方がいいですか？
    
    def detail_params
      params.fetch(:detail, {}).permit(:authenticity_token, :user_id, :mother_tongue, :japanese_level, :english_level,
                                    :gender, :region, :purpose, :self_introduction, :sns_1, :sns_2, :sns_3)
    end
    
    
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end