Rails.application.routes.draw do
  get 'users/new'

  resources :teams

  root 'teams#index'

  get '/signup', to: 'users#new'
end
