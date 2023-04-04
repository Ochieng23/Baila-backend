Rails.application.routes.draw do
  resources :listeners
  resources :uploads
  resources :songs
  resources :artists
  resources :categories
  resources :albums
  resources :users
  get '/latest', to: 'songs#latest'
  post '/signup', to: 'listeners#create'
  get '/me', to: 'listeners#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get '/current', to: 'listeners#current_user'
  get '/home', to: 'uploads#home'
  get '/sessions', to: 'sessions#index'
 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
