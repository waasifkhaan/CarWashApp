Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users do 
    resources :carwashes, only: [:show, :index, :new] 
  end 
  resources :cars
  resources :detailers
  
  resources :sessions
  
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
