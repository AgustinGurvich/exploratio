Rails.application.routes.draw do
  get 'eventos/listaev'
  get 'eventos/extensionev'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'eventos#listaev'
end
