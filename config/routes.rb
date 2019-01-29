Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'pages#home'

  resources :users
  resources :blogs
  resources :lessons
  resources :locations
  resources :messages, only:[:create]

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/myblogs', to: 'users#index'

end
