Rails.application.routes.draw do

  #resources: es un método utilizado para declarar rutas RESTful (get,post,put,delete,update,etc)}
  #generará automáticamente rutas y acciones para un controlador específico, en este caso event_controller
  resources :event
  
  #root: se usa para definir el index de la aplicación
  root 'home#index'
 
  # Asi se definen rutas personalizadas
  #get 'Cualquier-cosa', to: 'pages#about'

  #Asi se define una ruta simple
  #get 'pages/about'
  
end
