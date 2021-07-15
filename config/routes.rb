Rails.application.routes.draw do
  root 'static_pages#index'
  get '/signup', to: 'users#new'
  resources :static_pages, only: [:index]
  resources :users
end
