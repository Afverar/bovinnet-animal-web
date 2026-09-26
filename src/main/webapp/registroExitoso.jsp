<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="co.sena.bovinnet.animal.Animal" %>
<%--
    Vista JSP de confirmacion, mostrada despues de procesar el metodo
    POST del formulario. Usa expresiones JSP para mostrar el detalle
    del animal recien insertado, tomado de los atributos que el
    servlet dejo en la peticion con peticion.setAttribute(...).
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>BovinNet - Registro de animal</title>
    <style>
        body { font-family: Arial, sans-serif; background:#FBF8F3; color:#3E2C1C; padding: 30px; }
        .tarjeta { background:#F0E9DD; max-width: 480px; margin: 0 auto; padding: 24px 28px; border-radius: 10px; text-align:center; }
        .exito { color:#5C7A4B; font-weight:bold; }
        .fallo { color:#C9613D; font-weight:bold; }
        .detalle { text-align:left; background:#FBF8F3; border-radius:8px; padding:12px; margin-top:14px; font-size:14px; }
        a.boton { display:inline-block; margin-top:18px; background:#5C7A4B; color:#fff; text-decoration:none; padding:10px 18px; border-radius:20px; font-weight:bold; }
    </style>
</head>
<body>
<div class="tarjeta">
    <%
        boolean exito = Boolean.TRUE.equals(request.getAttribute("exito"));
        Animal animalRegistrado = (Animal) request.getAttribute("animalRegistrado");
    %>

    <% if (exito) { %>
        <h1 class="exito">Animal registrado con exito</h1>
        <div class="detalle">
            <p><strong>Arete:</strong> <%= animalRegistrado.getArete() %></p>
            <p><strong>Nombre:</strong> <%= animalRegistrado.getNombre() != null ? animalRegistrado.getNombre() : "-" %></p>
            <p><strong>Sexo:</strong> <%= animalRegistrado.getSexo() %></p>
            <p><strong>Fecha de nacimiento:</strong> <%= animalRegistrado.getFechaNacimiento() %></p>
            <p><strong>Lote:</strong> <%= animalRegistrado.getIdLote() %></p>
        </div>
    <% } else { %>
        <h1 class="fallo">No se pudo registrar el animal</h1>
        <p>Verifique los datos e intentelo nuevamente.</p>
    <% } %>

    <a class="boton" href="animales">Ver listado de animales</a>
</div>
</body>
</html>
