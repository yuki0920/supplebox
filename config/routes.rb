Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'rankings/like', to: 'rankings#like'
  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
 
  resources :users, only: [:show, :create, :index, :edit, :update, :index] do
    member do
      get :followings
      get :followers
      get :like_products
    end
  end
  
  resources :products, only: [:new, :create, :destroy, :show, :index]
  resources :posts, only: [:new, :create, :destroy, :show, :edit, :show, :update, :index]
  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
end
