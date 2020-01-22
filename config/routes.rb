Rails.application.routes.draw do
  
  post "likes/:id" => 'likes#create', as: :create_like
  delete "likes/:id" => 'likes#destroy', as: :delete_like

  resources :settings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  resources :posts
  resources :users
  resources :sessions
  resources :photos

  post "posts/:id/edit" => "posts#update"
  get 'posts/:wall_id/new' => 'posts#new'
  
  post 'users/new' => 'users#create'
  get "users/:id" => 'users#show'

  post '/sessions/new' => 'sessions#create'

  post '/photos/new' => 'photos#create'
  get '/users/:id/photos' => 'photos#user'

  get '/settings/profile-picture' => 'settings#photos'
  post '/settings/profile-picture' => 'settings#create_photo'
end
