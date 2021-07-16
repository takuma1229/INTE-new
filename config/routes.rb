Rails.application.routes.draw do
  root 'static_pages#index'
  resources :static_pages, only: [:index]
  resources :users
  resources :sessions, only: [:index, :create, :destroy]
  resources :details, only: [:index, :create]
end
