Rails.application.routes.draw do
  resources :friends
  get 'about/index'
  get 'pricing/index'
  devise_for :users
  # root to: 'home#index'
  root to: 'home#index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :users, only: [:show], param: :name, path: ""
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
