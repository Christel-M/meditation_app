Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'pages#home'

  resources :users, only:[:show, :edit, :update]
  # resources :blogs
  resources :locations
  resources :messages, only:[:create]

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end

  resources :blogs do
    resources :likes
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/myblogs', to: 'users#index'

  get '/lessons/beginner', to: 'lessons#beginner'
  get '/lessons/intermediate', to: 'lessons#intermediate'
  get '/lessons/advanced', to: 'lessons#advanced'
  get '/lessons/beginner/:id', to: 'lessons#show'
  get '/lessons/intermediate/:id', to: 'lessons#show'
  get '/lessons/advanced/:id', to: 'lessons#show'
  get '/lessons', to: 'lessons#index'

end
