Rails.application.routes.draw do
  resources :event
  
  root 'home#index'
  
end
