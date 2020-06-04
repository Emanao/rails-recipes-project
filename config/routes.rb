Rails.application.routes.draw do
  root 'recipes#index'

  get 'signup', to:'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :user, only: [:show] do
    resources :recipes
  end

  resources :recipes, only: [:index, :show]
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
