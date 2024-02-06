Rails.application.routes.draw do
 
  resources :events
  
  root 'home#index'
  
  devise_for :users
end
