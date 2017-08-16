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
  end

  def login
  end

  def newuser
  end
end
