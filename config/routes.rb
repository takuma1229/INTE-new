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
      get :following, :followers
    end
  end
  resources :sessions, only: [:index, :create, :destroy]
  resources :account_activations, only: [:index, :edit]
  resources :password_resets,     only: [:new, :create, :edit, :update] 
  resources :microposts,          only: [:create, :destroy, :show] do
    resources :likes, only: [:create, :destroy]
  end 
  resources :homes,               only: [:index]
  resources :relationships,       only: [:create, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
