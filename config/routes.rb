Rails.application.routes.draw do

  get '/login' => 'session#new'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'
  get '/register' => 'users#new'

  resources :users, only: [:index, :new, :create, :edit, :show]
  resources :teams, only: [:index, :new, :create, :edit, :show]
  resources :games, only: [:index, :new, :create, :edit, :show]
  resources :invitations
end
