Rails.application.routes.draw do
  resources :events
  
  root 'home#index'
  
  Rails.application.routes.draw do 
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
  end

end
