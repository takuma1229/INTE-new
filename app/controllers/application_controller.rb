class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery # :secret => 'gsMuXuyjtKFFLwLlFGy1cz6baA12XaP5D4PlGyEjJ8db3gkOs5g98jed5peMuX9RqB37paHULHImhNdCRpy9RA=='
end