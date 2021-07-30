class AccountActivationsController < ApplicationController

  def index
    @user = User.find_by(id: current_user.id)
  end
  

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to detail_user_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
