var reqUri = "https://ws.rosario.gov.ar/web/api/agenda.json" + location.search

function httpGET(Uri){
  var req = new XMLHttpRequest()
  req.open("GET", Uri, false)
  req.send(null)
  return req.responseText
}

var jsonData = JSON.parse('{"list": ' + httpGET(reqUri) + "}").list[0]

if (jsonData == null){
    document.getElementsByTagName("body")[0].innerHTML = ""
    alert("Error. Evento invalido")
}

document.title = jsonData.title
eventTitle.innerHTML = jsonData.title
eventTags.href = '../eventos/eventos.html?etiquetas=' + jsonData.etiquetas
eventTags.innerHTML = jsonData.etiquetas

if (jsonData.lugar_eventual != undefined) { eventLoc.innerHTML = jsonData.lugar_eventual }
else { eventLoc.innerHTML = "Sin ubicación" };

var date_inicio = jsonData.fecha_y_hora_inicio.slice(8,10);
if (date_inicio < 10) { date = jsonData.fecha_y_hora_inicio.slice(9,10); }
var date_fin = jsonData.fecha_y_hora_fin.slice(8,10);
if (date_fin < 10) { date = jsonData.fecha_y_hora_fin.slice(9,10); }

var month_inicio = jsonData.fecha_y_hora_inicio.slice(5,7);
switch(month_inicio){
    case "01":
        month_inicio = "enero";
        break;
    case "02":
        month_inicio = "febrero";
        break;
    case "03":
        month_inicio = "marzo";
        break;
    case "04":
        month_inicio = "abril";
        break;
    case "05":
        month_inicio = "mayo";
        break;
    case "06":
        month_inicio = "junio";
        break;
    case "07":
        month_inicio = "julio";
        break;
    case "08":
        month_inicio = "agosto";
        break;
    case "09":
        month_inicio = "septiembre";
        break;
    case "10":
        month_inicio = "octubre";
        break;
    case "11":
        month_inicio = "noviembre";
        break;
    case "12":
        month_inicio = "diciembre";
        break;
}

var month_fin = jsonData.fecha_y_hora_fin.slice(5,7);
switch(month_fin){
    case "01":
        month_fin = "enero";
        break;
    case "02":
        month_fin = "febrero";
        break;
    case "03":
        month_fin = "marzo";
        break;
    case "04":
        month_fin = "abril";
        break;
    case "05":
        month_fin = "mayo";
        break;
    case "06":
        month_fin = "junio";
        break;
    case "07":
        month_fin = "julio";
        break;
    case "08":
        month_fin = "agosto";
        break;
    case "09":
        month_fin = "septiembre";
        break;
    case "10":
        month_fin = "octubre";
        break;
    case "11":
        month_fin = "noviembre";
        break;
    case "12":
        month_fin = "diciembre";
        break;
}

if (date_inicio == date_fin && month_inicio == month_fin) { eventDate.innerHTML = date_inicio + " de " + month_inicio }
else { eventDate.innerHTML = "De " + date_inicio + " de " + month_inicio + " a " + date_fin + " de " + month_fin };

eventUri.innerHTML = jsonData.link
eventUri.href = jsonData.lugares[0].web
eventImg.src = jsonData.uri_imagen
if (jsonData.texto != null)
{
  eventDesc.innerHTML = jsonData.texto
}
else if (eventData.resumen != null)
{
  eventDesc.innerHTML = jsonData.resumen
}
else
{
  console.log(jsonData)
}

function initMap(){
}

var map = document.getElementById('map')
map.src= "https://www.rosario.gov.ar/web/webservices/mapa/mapa.html?x=" + jsonData.lugares[0].coordenada_x + "&y=" + jsonData.lugares[0].coordenada_y + "&nivelZoom=8"
