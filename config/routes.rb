Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :products, only: [:index, :show] do
    resource :favorite, only: [:create, :destroy]
  end

  resources :favorites, only: [:index]
  
  resource :order, only: [:show]
  resources :order_items, only: [:create, :update,:destroy]

  resources :orders, only: [:show] do
    post :checkout
  end

  root "products#index"

  namespace :dashboard do
    resources :products
  end

  namespace :admin do
    resources :categories
  end
end
