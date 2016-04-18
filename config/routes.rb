Rails.application.routes.draw do

  get '/login' => 'session#new'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'

  resources :users, only: [:index, :new, :create, :edit, :show]
end
