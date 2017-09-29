Rails.application.routes.draw do
	root to: 'businesses#index'

  devise_for :users
  resources :users, only: [:index]
  
  resources :businesses
end
