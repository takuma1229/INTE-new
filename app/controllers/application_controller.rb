class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery # :secret => 'gsMuXuyjtKFFLwLlFGy1cz6baA12XaP5D4PlGyEjJ8db3gkOs5g98jed5peMuX9RqB37paHULHImhNdCRpy9RA=='
  
  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to sessions_url
      end
    end

end