Rails.application.routes.draw do
  devise_for :users
  resources :circular_initiatives
  get 'pages/about'

  get 'pages/contact'

  root 'circular_initiatives#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
