# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show new]
  resources :posts, only: %i[edit index]

  namespace :api do
    resources :users, only: %i(create update show)
    resources :products, only: %i(index show new create) do
      resource :like, only: %i(create destroy)
    end
    resources :posts, only: %i(index create update show destroy)
    resources :contacts, only: %i(create)
    resource :sessions, only: %i(show create destroy) do
      post 'test_user', on: :collection
    end
  end
end
