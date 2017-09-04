Rails.application.routes.draw do
  
  get 'signup' =>'users#new'
  resources :users, except:[:new]

  root 'home#index'
  
  resources :articles
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
