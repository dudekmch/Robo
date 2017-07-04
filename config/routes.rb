Rails.application.routes.draw do
  root to: 'products#index'

  get 'regulamin', to: 'static#terms', as: :terms
  get 'polityka-prywatnosci', to: 'static#privacy', as: :privacy
  get 'dostawa', to: 'static#shipping', as: :shipping
  get 'o-sklepie', to: 'static#about', as: :about

  resources :categories, only: [:dupa]
  resources :products, only: %i[index show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
