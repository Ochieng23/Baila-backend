Rails.application.routes.draw do
  resources :songs
  resources :artists
  resources :categories
  resources :albums
  resources :users
  get '/latest', to: 'songs#latest'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
