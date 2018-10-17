Rails.application.routes.draw do
  resources :reviews, except: [:show, :index]
  resources :sectors
  devise_for :users
  resources :circular_initiatives do
  	collection do
  		get 'search'
  	end
  end

  get 'pages/about'

  get 'pages/contact'

  root 'circular_initiatives#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
