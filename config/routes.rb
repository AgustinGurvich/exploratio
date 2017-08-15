Rails.application.routes.draw do
  get '/eventos/' => "eventos#listaev"
  get '/eventos/:id' => 'eventos#extensionev'
  root 'eventos#listaev'
  get '*path' => 'application#not_found'
end
