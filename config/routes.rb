Rails.application.routes.draw do
	# serve websocket cable requests in-process
	mount ActionCable.server => '/cable'
	
	root to: 'businesses#index'

  devise_for :users
  resources :users, only: [:index, :edit, :update, :destroy]
  
  resources :businesses

  get 'unauthorized', to: 'pages#unauthorized', as: 'unauthorized'
end
