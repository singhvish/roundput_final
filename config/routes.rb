Rails.application.routes.draw do
  
  resources :newsletters
  devise_for :users
  resources :circular_initiatives do
    resources :reviews, except: [:show, :index]
    member { post :vote }
  end

  get 'pages/about'

  get 'pages/contact'

  get 'pages/privacy'

  root 'circular_initiatives#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
