Rails.application.routes.draw do
  
  root  'application#welcome'

  resources :users do 
    resources :lists
  end
  resources :items
  resources :categories

end
