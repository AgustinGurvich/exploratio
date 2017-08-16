Rails.application.routes.draw do
  get '/eventos/' => "eventos#listaev"
  get '/login' => 'eventos#login'
  get '/newuser' => 'eventos#newuser'
  get '/eventos/:id' => 'eventos#extensionev'
  root 'eventos#listaev'
end
