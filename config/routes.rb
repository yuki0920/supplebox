# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'policy', to: 'toppages#policy'
  get 'privacypolicy', to: 'toppages#privacypolicy'
  get 'contacts', to: 'contacts#new'
  get 'sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/supplebox/sitemaps/sitemap.xml.gz')
  resources :users, only: %i[show create edit update destroy] do
    member do
      get :like_products
    end
  end

  resources :products, only: %i[index show new]
  resources :posts, only: %i[destroy edit index]
  resources :likes, only: %i[create destroy]

  namespace :api do
    resources :users, only: %i(create update show)
    resources :products, only: %i(index show new create) do
      resource :like, only: %i(create destroy)
    end
    resources :posts, only: %i(index create update show destroy)
    resources :contacts, only: %i(create)
    resource :sessions, only: %i(show create destroy)
  end
end
