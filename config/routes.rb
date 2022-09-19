Rails.application.routes.draw do
  get "/search_address" , to: 'users#search_address'
  resources :users
  get '/search_user', to: 'users#search_user'
 end
