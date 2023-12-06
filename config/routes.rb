# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/create'
  get 'comments/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :posts
end
