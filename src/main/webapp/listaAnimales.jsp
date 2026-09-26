<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="co.sena.bovinnet.animal.Animal" %>
<%--
    Vista JSP que muestra el listado de animales consultado por
    AnimalServlet (metodo doGet). Elementos de JSP usados:
    - Directivas de pagina (<%@ page %>) para el tipo de contenido
      y los import de Java necesarios.
    - Scriptlet (<% %>) para recorrer la lista recibida como atributo
      de la peticion.
    - Expresiones JSP (<%= %>) para imprimir cada valor del animal.
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>BovinNet - Listado de animales</title>
    <style>
        body { font-family: Arial, sans-serif; background:#FBF8F3; color:#3E2C1C; padding: 30px; }
        .contenedor { max-width: 760px; margin: 0 auto; }
        h1 { color:#3E2C1C; }
        table { width:100%; border-collapse: collapse; background:#F0E9DD; border-radius:8px; overflow:hidden; }
        th { background:#5C7A4B; color:#fff; text-align:left; padding:10px; }
        td { padding:10px; border-top:1px solid #D9C4A3; }
        tr:nth-child(even) td { background:#FBF8F3; }
        a.boton { display:inline-block; margin-bottom:16px; background:#5C7A4B; color:#fff; text-decoration:none; padding:10px 18px; border-radius:20px; font-weight:bold; }
        .vacio { padding:16px; text-align:center; color:#7A6A54; }
    </style>
</head>
<body>
<div class="contenedor">
    <h1>Animales registrados en BovinNet</h1>
    <a class="boton" href="formularioAnimal.html">+ Registrar nuevo animal</a>

    <%
        // Scriptlet: se obtiene la lista enviada por el servlet con
        // peticion.setAttribute("listaAnimales", ...) en el metodo doGet.
        @SuppressWarnings("unchecked")
        List<Animal> listaAnimales = (List<Animal>) request.getAttribute("listaAnimales");
    %>

    <% if (listaAnimales == null || listaAnimales.isEmpty()) { %>
        <p class="vacio">Aun no hay animales registrados.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Id</th>
                <th>Arete</th>
                <th>Nombre</th>
                <th>Sexo</th>
                <th>Fecha de nacimiento</th>
                <th>Lote</th>
            </tr>
            <% for (Animal animal : listaAnimales) { %>
            <tr>
                <td><%= animal.getIdAnimal() %></td>
                <td><%= animal.getArete() %></td>
                <td><%= animal.getNombre() != null ? animal.getNombre() : "-" %></td>
                <td><%= animal.getSexo() %></td>
                <td><%= animal.getFechaNacimiento() %></td>
                <td><%= animal.getIdLote() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>
</div>
</body>
</html>
