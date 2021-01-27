# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/show'
  devise_for :users
  ActiveAdmin.routes(self)
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
  resources :products do
    resources :order_items, only: %i[create update destroy]
  end
  resources :orders, only: :show
  resources :comments
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
