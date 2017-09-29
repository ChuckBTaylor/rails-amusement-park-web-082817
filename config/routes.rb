Rails.application.routes.draw do
  resources :users
  resources :attractions
  root to:'static#home'
  get '/signin', to: 'sessions#signin', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/ride/:id', to: 'users#ride'

end
