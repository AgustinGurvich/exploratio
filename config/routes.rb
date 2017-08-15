Rails.application.routes.draw do
<<<<<<< HEAD
  
  get '/eventos/' => "eventos#listaev"
  get '/eventos/:id' => 'eventos#extensionev'
=======
match '/eventos', to: 'eventos#listaev', via: :get
match '/eventos/:id', to: 'eventos#extensionev', via: :get

>>>>>>> 0d04ebd531a05f19fed1daac65ef2d0513b9e413
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'eventos#listaev'
  get '*path' => 'application#not_found'
end
