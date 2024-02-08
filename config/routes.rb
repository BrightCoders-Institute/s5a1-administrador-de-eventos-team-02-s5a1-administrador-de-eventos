Rails.application.routes.draw do
 
  resources :events
  
  root 'home#index'
  
  devise_for :users

  get ':name/my_events', to: 'events#my_events', as: 'my_events'
end
