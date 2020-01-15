Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts
  resources :users

  post "posts/:id/edit" => "posts#update"
  delete "posts/:id" => "posts#destroy"
  
  post 'users/new' => 'users#create'
  get '/welcome' => 'sessions#index'
  
end
