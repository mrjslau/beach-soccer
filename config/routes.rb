Rails.application.routes.draw do
  get 'users/new'

  resources :teams
  resources :users

  root 'teams#index'

  get '/signup', to: 'users#new'
end
