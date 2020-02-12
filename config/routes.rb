Rails.application.routes.draw do

  root 'gossips#index'

  get 'static/index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'static#welcome'

  post '/', to: 'static#welcome_post' 

  resources :gossips, only: [:new, :create, :show, :index]
  resources :users, only: [:new, :create, :show, :index]

end
