Rails.application.routes.draw do
	root to: 'businesses#index'

  devise_for :users
  resources :users, only: [:index, :edit, :update]
  
  resources :businesses

  get 'unauthorized', to: 'pages#unauthorized', as: 'unauthorized'
end
