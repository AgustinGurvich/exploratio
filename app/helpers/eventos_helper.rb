module EventosHelper
  def eventValidator(jObj)
    if jObj["lugares"].length == 0 then
    end

    if (jObj["texto"] == nil && jObj["resumen"] == nil) then
      jObj["texto"] = ""
      jObj["resumen"] = ""
    elsif jObj["resumen"] != nil then
      jObj["texto"] = jObj["resumen"]
    elsif jObj["texto"] != nil then
      jObj["resumen"] = jObj["texto"]
    end

    if jObj["uri_imagen"] == nil then
      jObj["uri_imagen"] = "https://www.rosario.gov.ar/web/sites/default/files/16232-736578_0.jpg"
    end
    return jObj
  end

  def subString(string, length)
    if string != nil then
      if string.length > length then
        return string[0, (length-3)] + "..."
      else 
        return string
      end
    else
      return ""
    end
  end
end
