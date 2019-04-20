Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :index]
  resources :products, only: [:new, :create, :destroy, :show] 
  resources :posts, only: [:new, :create, :destroy, :show] 
  resources :likes, only: [:create, :destroy]  
  
end
