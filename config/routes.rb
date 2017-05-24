Rails.application.routes.draw do

  root "site#index"

  resources :owners

  get '/signup' => 'owners#new'
  post '/owners' => 'owners#create'

end
