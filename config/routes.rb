Rails.application.routes.draw do
  resources :events do
    member do
      get 'edit_image', to: 'events#edit_image', as: 'edit_image' # Vista para editar la imagen
      patch 'update_image', to: 'events#update_image', as: 'update_image' # Actualizar la imagen
      delete 'delete_image', to: 'events#delete_image', as: 'delete_image' # Eliminar la imagen
    end
  end

  root 'home#index'

  # Configuración de las rutas de Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations', # Controlador personalizado para registro
    confirmations: 'users/confirmations'  # Controlador personalizado para confirmación del correo electrónico
  }

  get ':name/my_events', to: 'events#my_events', as: 'my_events'
  get 'events_filters', to: 'events#events_filters', as: 'events_filters'
end
