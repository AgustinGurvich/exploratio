Rails.application.routes.draw do
  match '/eventos', to: 'eventos#listaev', via: :get
  match '/eventos/:id', to: 'eventos#extensionev', via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'eventos#listaev'
end
