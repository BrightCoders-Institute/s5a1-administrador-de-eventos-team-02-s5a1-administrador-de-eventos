Rails.application.routes.draw do
 
  resources :events
  
  root 'home#index'
  
  Rails.application.routes.draw do
    devise_for :users
  end
end
