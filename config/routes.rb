Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :index, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :products, only: [:new, :create, :destroy, :show, :index]
  resources :posts, only: [:new, :create, :destroy, :show, :edit, :show, :update]
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
end
