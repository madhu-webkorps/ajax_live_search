Rails.application.routes.draw do
  resources :users
  get '/search_user', to: 'users#search_user'
 end
