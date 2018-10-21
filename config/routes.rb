Rails.application.routes.draw do
  resources :clients
  resources :cars
  resources :detailers
  resources :carwashes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
