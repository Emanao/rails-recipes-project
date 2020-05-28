Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes
  get 'users/new'
  get 'sessions/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
