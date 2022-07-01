<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<body>
<p id="demo">Pulsa para ver tu localizaci&oacute;n</p>
<button onclick="getLocation()">Pulsa aqu&iacute;</button>
<div id="posicion"></p>
<div id="mapholder"></div>
<div id="info"></div>

<script type="text/javascript">
var x=document.getElementById("demo");
var y=document.getElementById("info");
function getLocation()
  {
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition,showError);
		x.innerHTML="Tu navegador adimte la geolocalizaci&oacute;n";
    }
  else{x.innerHTML="Tu navegador no soporta la geolocalizaci&oacute;n.";}
  }

function showPosition(position)
  {
	lat=position.coords.latitude;
	lon=position.coords.longitude;
  var latlon=lat+","+lon;
  var img_url="http://maps.googleapis.com/maps/api/staticmap?center="
  +latlon+"&zoom=14&size=400x300&sensor=false";
  
	y.innerHTML="Latitud: "+lat;
	y.innerHTML+="<br/>Longitud: "+lon;
	y.innerHTML+="<br/>Precisi&oacute;n: "+position.coords.accuracy;
	y.innerHTML+="<br/>Altidud: "+position.coords.altitude;
	y.innerHTML+="<br>Precisi&oacute;n de Altidud: "+position.coords.altitudeAccuracy;
	y.innerHTML+="<br>Heading: "+position.coords.heading;
	y.innerHTML+="<br>Velocidad: "+position.coords.speed;
	y.innerHTML+="<br>Fecha (en tiempo Unix): "+position.timestamp;
  }

function showError(error)
  {
  switch(error.code) 
    {
    case error.PERMISSION_DENIED:
      x.innerHTML="El usuario ha denegado el permiso a la localizaci&oacute;n."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML="La informaci&oacute;n de la localizaci&oacute;n no est&aacute; disponible."
      break;
    case error.TIMEOUT:
      x.innerHTML="El tiempo de espera para buscar la localizaci&oacute;n ha expirado."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML="Ha ocurrido un error desconocido."
      break;
    }
  }
</script>
</body>
</html>