<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE HTML>
<html>
<head>
<title>Arrastrar y soltar</title>
</head>
<style type="text/css">
/*estilo general: resetear*/
* { margin: 0 auto; padding: 0;  } 
/*estilo de t�tulo y subt�tulo*/
h1 { font:bold 1.5em helvetica; text-align: center; color: navy; margin: 0.5em; }
h2 { font: bold 1em helvetica; text-align: center; margin: 0.5em; }
/*estilo de contenedores*/
#cont0 { width: 80%; height: 300px;  }
#cont1 { width: 50%; height: 300px; background-color:#ccffff; float: left; overflow: auto; }
#cont2 { width: 50%; height: 300px; background-color:#ffccff; float: left; overflow: auto; }
</style>

<script type="text/javascript">
//Recoger elemento arrastrable//
function evdragstart(ev,el) { //ev= el evento, el=elemento arrastrado.
    cont1=el.parentNode; //guardamos el elemento padre del elemento en una variable.
    ev.dataTransfer.setData("text",ev.target.id);	//guardamos datos del elemento. 
}
//mientras se arrastra:
function evdragover (ev) { //ev=el evento.
    ev.preventDefault(); //quitar comportamiento por defecto.
}
//Al soltar el elemento arrastrado
function evdrop(ev,el) { //ev=el evento; el=receptor de soltado
    ev.stopPropagation(); //impedir otras acciones 
    ev.preventDefault(); //quitar comportamiento por defecto
    var data=ev.dataTransfer.getData("text"); //recogemos datos del elemento
    mielem=ev.target.appendChild(document.getElementById(data)); //obtenemos el elemento arrastrado
    cont1.appendChild(mielem); //ponemos el elemento arrastrado en el mismo sitio donde estaba.
    mielem2=mielem.cloneNode(true); //creamos una copia del elemento arrastrado.
    mielem2.setAttribute("draggable","false"); //impedimos que el nuevo elemento pueda volver a arrastrarse
    el.appendChild(mielem2); //colocamos la copia en el receptor de soltado
}
</script>

<body>
<h1>arrastrar y soltar</h1>
<h2>pon los elementos del contenedor de la izquierda en el de la derecha.</h2>
<div id="cont0">

<!--contenedor de salida-->
<div id="cont1" >
<!-- Cada elemento est� dentro de un contenedor, (div o span), lo cual permitir� 
     recuperarlo en su sitio despu�s de ser arrastrado.-->
<div><p draggable="true" ondragstart="evdragstart(event,this)" id="e1">Elemento arrastrable</p></div>
<div><p draggable="true" ondragstart="evdragstart(event,this)" id="e2">Google: 
     <a href="http://google.es" target="_blank">ir a Google</a>	
	</p></div>
<div><ul draggable="true" ondragstart="evdragstart(event,this)" id="e3">
     <li>Primer elemento</li>
     <li>Segundo elemento</li>
	</ul></div>
 
</div> 

<!--receptor de soltado -->
<div id="cont2" ondragover="evdragover(event)" ondrop="evdrop(event,this)">
</div> 

</div>
</body>
</html>


