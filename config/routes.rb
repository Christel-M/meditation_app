Rails.application.routes.draw do

  get 'locations/new'
  get 'locations/edit'
  get 'locations/show'
  get 'locations/index'
  root 'pages#home'

  resources :users
  resources :blogs
  resources :lessons
  resources :locations

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
