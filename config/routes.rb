Rails.application.routes.draw do

  root 'gossips#index'

  get 'static/index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'static#welcome'

  post '/', to: 'static#welcome_post' 

  resources :gossips
  resources :users, only: [:new, :create, :show, :index]
  resources :cities, only: [:new, :create, :show, :index]
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
end
