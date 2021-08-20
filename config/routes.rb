Rails.application.routes.draw do
  
  root  'application#welcome'

  get '/users/:user_id/lists/favorites' => 'lists#favorites'

  resources :users do 
    resources :lists
  end
  resources :sessions, only: [:create, :destroy]

  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]

  match "*any", via: :all, to: "errors#not_found"

end
