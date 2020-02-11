Rails.application.routes.draw do
  get 'gossip/display'
  get 'user/welcome'
  root "static#index"

  get 'static/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'team', to: 'static#team'

  get 'contact', to: 'static#contact'

  get 'welcome/:first_name', to: 'user#welcome'

  post '/', to: 'user#welcome_post' 

  get 'gossip/:id', to: 'gossip#display', as: 'gossip'

  get 'user/:id', to: 'user#display_user', as: 'user'
end
