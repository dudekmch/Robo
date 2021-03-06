Rails.application.routes.draw do

  resources :line_items do
    member do
      post :show_order_items
    end
  end

  resources :summary, only: %i[show] do
    member do
      post :order_confirmation
    end
  end

  resources :addresses

  resources :carts, controller: 'cart', only: %i[index update edit] do
    member do
      post :add_product
      post :remove_product
      post :add_shipping_type_to
      get :collect
    end
  end

  devise_for :users

  namespace :admin do
    root to: 'products#index'
    resources :categories
    resources :products
    resources :users
    resources :orders, only: %i[index show update]
  end

  root to: 'products#index'

  get 'regulamin', to: 'static#terms', as: :terms
  get 'polityka-prywatnosci', to: 'static#privacy', as: :privacy
  get 'dostawa', to: 'static#shipping', as: :shipping
  get 'o-sklepie', to: 'static#about', as: :about

  resources :categories, only: [:show]
  resources :products, only: %i[index show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
