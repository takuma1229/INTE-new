Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#index'
  resources :static_pages, only: [:index]
  resources :users do
    member do
      get 'detail'
      patch 'detailcreate'
    end
  end
  resources :sessions, only: [:index, :create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
