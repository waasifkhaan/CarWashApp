Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users do 
    resources :carwashes
    resources :cars, only: [:new, :create, :show]
  end 
  
  resources :sessions
  
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#oauth'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
