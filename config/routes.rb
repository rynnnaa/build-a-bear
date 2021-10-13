Rails.application.routes.draw do
  get 'signin', to: 'sessions#signin'
  get 'signup', to: 'users#new'
  post '/signin', to: 'sessions#signin'
  get 'sessions/new', to: 'sessions#new'
  get '/login', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  resources :stuffed_animals
  resources :animals
  resources :users
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
