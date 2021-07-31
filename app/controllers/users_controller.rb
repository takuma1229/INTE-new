class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new 
      end
    end
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
      @user.send_activation_email
      log_in @user
      flash[:info] = "Please check your email to activate your account."
      # redirect_to after_signup_path
      #redirect_to new_detail_path
      # TODO: ここでユーザー認証を促す画面にリダイレクトさせるようにあとで設定する
      # redirect_to root_url
      redirect_to account_activations_path
    else
      render 'new'
    end
  end

  def detail
    @user = User.find(params[:id])
  end

  def detailcreate
    @user = User.find_by(id: params[:id])
    #binding.pry
    if @user.update(user_update_params)
      redirect_to @user
    else
      binding.pry
      flash.now[:danger] = "Invalid information is included."
      render 'detail'
    end
  end
  

  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    #binding.pry
    if @user.update(user_params)
      flash.now[:success] = "Profile updated"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid information is included."
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
        :password_confirmation,
        :mother_tongue,
        :japanese_level,
        :english_level,
        :gender,
        :region,
        :purpose,
        :self_introduction,
        :skype,
        :discord,
        :other#,
        # :authenticity_token
          )
    end
    # .merge(user_id: User.find_by(id: params[:id]).id) #これはつけた方がいいですか？
    
    def user_update_params 
      params.permit(
        :mother_tongue,
        :japanese_level,
        :english_level,
        :gender,
        :region,
        :purpose,
        :self_introduction,
        :skype,
        :discord,
        :other
          )
    end
    
    
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    
    
end