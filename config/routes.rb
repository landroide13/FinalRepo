Rails.application.routes.draw do
  
  get 'signup' =>'users#new'
  resources :users, except: [:new]

  root 'home#index'
  
  resources :articles
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :categories, except: [:destroy]
  
end
