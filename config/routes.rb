Rails.application.routes.draw do
  
  root  'application#welcome'

  resources :users do 
    resources :lists
  end
  resources :sessions, only: [:create, :destroy]
  resources :items
  resources :categories

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]

end
