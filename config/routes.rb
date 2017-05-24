Rails.application.routes.draw do

  root "site#index"

  resources :owners

  # signup new owners
  get '/signup' => 'owners#new'
  post '/owners' => 'owners#create'

  # login exisitng owners
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
