
var reqUri = "https://ws.rosario.gov.ar/web/api/agenda.json" + location.search

function stringTrim(text, lng) {
    if (text != null && text.length < lng)
    {
      return text.substring(0,lng-3) + "..."
    }
    else if (text != null)
    {
      return text
    }
    else 
    {
      return null
    }
}

function makeDiv(eventData) {
  var item = document.createElement("div")
    item.classList.add("col-md-4")
    item.classList.add("col-xs-4")
    item.classList.add("col-lg-4")
    item.classList.add("portfolio-item")
    item.classList.add("container-fluid")
  var picture = document.createElement("img")
    picture.width = "700"
    picture.classList.add("img-responsive")
    picture.src = eventData.uri_imagen
  var title = document.createElement("a")
    title.innerHTML = "<h3>" + stringTrim(eventData.title, 50) + "</h3>"
    title.href = "../extensionevento/extensionevento.html?nid=" + eventData.nid
  var desc = document.createElement("div")
    if (stringTrim(eventData.texto, 100) != null)
    {
      desc.innerHTML = stringTrim(eventData.texto, 100) 
    }
    else if (stringTrim(eventData.resumen, 100) != null)
    {
      desc.innerHTML = stringTrim(eventData.resumen, 100) 
    }
    else
    {
      console.log(eventData)
    }
    desc.style="max-height: 100px; overflow-y: auto; overflow-x: hidden;"
  var loc = document.createElement("span")
    loc.classList.add("glyphicon")
    loc.classList.add("glyphicon-map-marker")
    if (eventData.lugar_eventual != null)
    {
      loc.innerHTML = eventData.lugar_eventual
    }
    else if (eventData.lugares[0] != null)
    {
      loc.innerHTML = eventData.lugares[0].nombre
    }
  var date = document.createElement("span")
    date.classList.add("glyphicon")
    date.classList.add("glyphicon-calendar")
    date.innerHTML = eventData.fecha_y_hora_inicio
  var more = document.createElement("a")
    more.classList.add("btn")
    more.classList.add("btn-default")
    more.href = "../extensionevento/extensionevento.html?nid=" + eventData.nid
    more.setAttribute("role", "button")
    more.innerHTML = "Ver más"
    more.style = "bottom: 0px;";
    title.style="position: relative; width: 100%;"

  item.appendChild(picture)
  item.appendChild(title)
  item.appendChild(desc)
  item.appendChild(loc)
  item.innerHTML += "<br>"
  item.appendChild(date)
  item.innerHTML += "<br>"
  item.appendChild(more)
  return item
}

window.onload = function()
{
    var container = document.getElementById("items")
    var req = new XMLHttpRequest()
    req.open("GET", reqUri, false)
    req.send(null)
    var jsonData = JSON.parse('{"list": ' + req.responseText + '}')
    var row = document.createElement("div")
    for (var i = 0; i < jsonData.list.length; i++)
    {
        if (i%3 == 0 || i == 0 )
        {
          row = document.createElement("div")
          row.classList.add("row")
          row.classList.add("container-fluid")
          row.appendChild(makeDiv(jsonData.list[i]))
          container.appendChild(row)
        }
        else
        {
          row.appendChild(makeDiv(jsonData.list[i]))
          container.appendChild(row)
        }
    }
}
