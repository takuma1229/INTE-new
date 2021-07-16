class DetailsController < ApplicationController

  def index
    @user = User.find_by(id: current_user.id)
  end
  
  def create
    @user = User.find_by(id: current_user.id)
    #binding.pry
    if @user.update(user_params)
      if @user.save
      redirect_to @user
      end
    else
      flash[:danger] = "Invalid information is included."
      render 'index'
    end
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
        :other,
        :authenticity_token
          )
    end
  

end
