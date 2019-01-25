Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  resources :blogs
  resources :lessons

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
