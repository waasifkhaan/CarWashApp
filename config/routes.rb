Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users do 
    resources :carwashes
    resources :cars, only: [:new, :create, :show]
  end 
  resources :cars
  resources :detailers
  
  resources :sessions
  
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'feedback', to: 'carwashes#feedback'
  patch 'feedback/update', to: 'carwashes#feedback_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
