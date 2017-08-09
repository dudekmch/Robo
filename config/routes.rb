Rails.application.routes.draw do
  get 'summary/show_summary'

  resource :summary do
    member do
      get :show_summary
    end
  end
  
  resources :addresses

  resource :cart, controller: 'cart', only: %i[show update edit] do
    member do
      post :add_product
      post :remove_product
    end
  end

  devise_for :users
  namespace :admin do
    root to: 'products#index'
    resources :categories
    resources :products
    resources :users
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
