<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--
    Vista JSP que se muestra cuando el formulario de registro se envia
    con campos obligatorios vacios. Usa una directiva de pagina, una
    expresion JSP (<%= %>) y un scriptlet (<% %>) como elementos
    basicos de JSP exigidos por la evidencia.
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>BovinNet - Error de registro</title>
    <style>
        body { font-family: Arial, sans-serif; background:#FBF8F3; color:#3E2C1C; padding: 30px; }
        .tarjeta { background:#F0E9DD; max-width: 480px; margin: 0 auto; padding: 24px 28px; border-radius: 10px; text-align:center; }
        .error { background:#FBEDE7; border-left:4px solid #C9613D; padding:12px; margin:16px 0; text-align:left; }
        a.boton { display:inline-block; margin-top:10px; background:#5C7A4B; color:#fff; text-decoration:none; padding:10px 18px; border-radius:20px; font-weight:bold; }
    </style>
</head>
<body>
<div class="tarjeta">
    <h1>No se pudo registrar el animal</h1>

    <% // Scriptlet: se lee el atributo enviado por el servlet mediante request.setAttribute
       String mensaje = (String) request.getAttribute("mensajeError");
       if (mensaje == null) {
           mensaje = "Ocurrio un error inesperado al procesar el formulario.";
       }
    %>

    <div class="error"><%= mensaje %></div>

    <a class="boton" href="formularioAnimal.html">Volver al formulario</a>
</div>
</body>
</html>
