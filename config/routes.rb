Rails.application.routes.draw do
  resources :events
  
  root 'home#index'
  
end
