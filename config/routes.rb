Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'users#home', as: '/root'

  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
  resources :users
  resources :attractions
  resources :rides, only: [:create]
end