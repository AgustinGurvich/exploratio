Rails.application.routes.draw do
  get '/eventos/' => "eventos#listaev"
  get '/login' => 'eventos#login'
  get '/newuser' => 'eventos#newuser'
  get '/eventos/:id' => 'eventos#extensionev'
  get '/crearev' => 'eventos#crearev'
  get '/error' => 'eventos#error'
  root 'eventos#listaev'
end
