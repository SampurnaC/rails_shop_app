Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :products
  root "products#index"

  resources :admin do
    resources :category
  end
end
