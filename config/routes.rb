Rails.application.routes.draw do

  resources :feature_options
  resources :features
  resources :animals
  resources :users
  root 'welcome#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
