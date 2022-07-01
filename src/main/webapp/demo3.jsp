<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>USO DE CANVAS</h1>
 <canvas id="canvas"></canvas>
 <script type="text/javascript">
 
 const canvas = document.getElementById('canvas');
 const ctx = canvas.getContext('2d');

 ctx.fillStyle = 'green';
 ctx.fillRect(10, 10, 150, 100);
 
 </script>
</body>
</html>