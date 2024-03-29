Rails.application.routes.draw do
  resources :events do
    member do
      get 'edit_image', to: 'events#edit_image', as: 'edit_image' # Vista para editar la imagen
      patch 'update_image', to: 'events#update_image', as: 'update_image' # Actualizar la imagen
      delete 'delete_image', to: 'events#delete_image', as: 'delete_image' # Eliminar la imagen
    end
  end

  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  get ':name/my_events', to: 'events#my_events', as: 'my_events'
  get 'events_filters', to: 'events#events_filters', as: 'events_filters'
  get 'export', to: 'events#export', as: 'export', format: 'csv'
end
