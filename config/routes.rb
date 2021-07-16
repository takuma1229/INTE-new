Rails.application.routes.draw do
  root 'static_pages#index'
  get 'detail', to: 'users#detail'
  patch 'detail', to: 'users#update'
  resources :static_pages, only: [:index]
  resources :users
  resources :sessions, only: [:index, :create, :destroy]
  # resources :details, only: [:index, :create]
end
