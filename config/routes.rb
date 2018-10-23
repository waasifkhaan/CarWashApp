Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users
  resources :cars
  resources :detailers
  resources :carwashes
  resources :sessions
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
