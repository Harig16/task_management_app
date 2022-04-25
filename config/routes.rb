Rails.application.routes.draw do

  #post '/tasks', to: 'tasks#create'
  resources :tasks, only: [:create, :edit, :update]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root 'dashboards#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  resources :users
end
