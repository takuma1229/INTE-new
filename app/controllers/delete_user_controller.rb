class DeleteUserController < ApplicationController
  before_action :logged_in_user

  def show
    @user = User.find_by(id: current_user.id)
    
  end

  def destroy
    @user = User.find_by(id: current_user.id)
    @user.destroy
    flash[:success] = "Your account is successfully deleted. Thank you for using INTE!"
    redirect_to root_path
  end
  
  
end
