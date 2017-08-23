require 'net/http'
require 'json'

class EventosController < ApplicationController
  def listaev
    datosURL = URI.parse("http://ws.rosario.gov.ar/web/api/agenda.json")
    resp = Net::HTTP.start(datosURL.host, datosURL.port) {
      |http|
      http.request(Net::HTTP::Get.new(datosURL.to_s))
    }
    @rawJson = resp.body
        
  end

  def extensionev
    datosURL = URI.parse("http://ws.rosario.gov.ar/web/api/agenda.json?nid=#{params[:id]}")
    resp = Net::HTTP.start(datosURL.host, datosURL.port) {
      |http|
      http.request(Net::HTTP::Get.new(datosURL.to_s))
    }
    @Json = JSON.parse(resp.body)
    if @Json[0] == nil
      render html: "Error: 404: Not Found"
    else
      @Json = @Json[0]
      @Title = @Json["title"]
      @Desc = @Json["texto"]
      @ImgUri = @Json["uri_imagen"]
      @Date = @Json["fecha_y_hora_inicio"]
      if @Json["lugares"].length == 0
        @Location = nil
      else
        @Location = {
          "name" => @Json["lugares"][0]["nombre"],
          "full_addres" => @Json["lugares"][0]["direccion_completa"],
          "coordx" => @Json["lugares"][0]["coordenada_x"],
          "coordy" => @Json["lugares"][0]["coordenada_y"]
        } 
      end
      @WebSite = @Json["link"]
    end
  end
end
