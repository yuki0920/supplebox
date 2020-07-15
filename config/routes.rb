# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'policy', to: 'toppages#policy'
  get 'privacypolicy', to: 'toppages#privacypolicy'
  get 'rankings', to: 'rankings#like'
  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  get 'sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/supplebox/sitemaps/sitemap.xml.gz')
  resources :users, only: %i[show create index edit update destroy] do
    member do
      get :followings
      get :followers
      get :like_products
    end
  end

  resources :products, only: %i[index show new create edit update destroy]
  resources :posts, only: %i[new create destroy show edit update index]
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :brands, only: %i[index show new create edit update destroy]
end
