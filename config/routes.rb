Rails.application.routes.draw do
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  resources :posts
  get 'posts/:wall_id/new' => 'posts#new', as: :new_wall_post
  
  resources :settings
  
  resources :sessions, only: [:new, :index, :create, :destroy]
  resources :photos
  
  post "likes/:id" => 'likes#create', as: :create_like
  delete "likes/:id" => 'likes#destroy', as: :delete_like

  
  get '/settings/profile-picture' => 'settings#photos'
  post '/settings/profile-picture' => 'settings#create_photo'

  resources :users, only: [:new, :create]
  get '/:id' => 'users#show', as: :user
  get '/:id/photos' => 'photos#user', as: :user_photos
end
