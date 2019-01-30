Rails.application.routes.draw do
  get 'profile/index'
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  resources :boards do
  	resources :comments
  end
  resources :searches 

  #actual root
  root to: 'boards#index' , as: 'home' # main page
  resources :tags, only: [:show]
	#root 'boards#index'  # main page
	get 'about' => 'pages#about' , as: 'about'
	get 'profile' => 'pages#profile' , as: 'profile' #стр. профиля

	resources :board
	#resources :posts



	#Для юзеров

	# get ‘users/:id’, to: ‘users#show’, as: ‘user’
	# get ‘users’, to: ‘users#index’, as: ‘users’

	end
