Rails.application.routes.draw do
  resources :users
  get '/address_count', to: 'users#address_count'
  post 'address_count', to: 'users#address_count2'
  
 end
