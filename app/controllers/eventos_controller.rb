require 'net/http'
require 'json'

class EventosController < ApplicationController
  def listaev
    datosURL = URI.parse("http://ws.rosario.gov.ar/web/api/agenda.json?limit=300")
    resp = Net::HTTP.start(datosURL.host, datosURL.port) {
      |http|
      http.request(Net::HTTP::Get.new(datosURL.to_s))
    }
    jObj = JSON.parse(resp.body)
    
    @events = jObj
  end

  def extensionev
    datosURL = URI.parse("http://ws.rosario.gov.ar/web/api/agenda.json?nid=#{params[:id]}")
    resp = Net::HTTP.start(datosURL.host, datosURL.port) {
      |http|
      http.request(Net::HTTP::Get.new(datosURL.to_s))
    }
    jObj = JSON.parse(resp.body)[0]
    if jObj == nil
      redirect_to :status => 404
    else
      if jObj["lugares"].length != 0
        @Location = {
        "name" => jObj["lugares"][0]["nombre"],
        "full_address" => jObj["lugares"][0]["direccion_completa"],
        "coordx" => jObj["lugares"][0]["coordenada_x"],
        "coordy" => jObj["lugares"][0]["coordenada_y"]
        }
      else
        @Location = nil
      end
      @Title = jObj["title"]
      @Desc = jObj["texto"]
      @Date = jObj["fecha_y_hora_inicio"]
      @ImgUri = jObj["uri_imagen"]
    end
  end

  def login
  end

  def newuser
  end

  def crearev
  end

  def error
  end
  
end
