package co.sena.bovinnet.web;

import co.sena.bovinnet.animal.Animal;
import co.sena.bovinnet.animal.AnimalDAO;
import co.sena.bovinnet.animal.AnimalDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

/**
 * Servlet del modulo de animales de BovinNet.
 *
 * Evidencia GA7-220501096-AA2-EV02: codificacion de un modulo web
 * con Servlets y JSP, tomando como referencia el mismo diagrama de
 * clases, historia de usuario y modelo relacional usados en la
 * evidencia GA7-220501096-AA2-EV01 (modulo JDBC de consola).
 *
 * - doGet: atiende la consulta y lista los animales registrados,
 *   reenviando el resultado a la vista JSP listaAnimales.jsp.
 * - doPost: atiende el envio del formulario HTML de registro
 *   (formularioAnimal.html) e inserta un nuevo animal.
 */
@WebServlet(name = "AnimalServlet", urlPatterns = {"/animales"})
public class AnimalServlet extends HttpServlet {

    private final AnimalDAO animalDAO = new AnimalDAOImpl();

    /**
     * Metodo GET: consulta todos los animales registrados y los
     * envia a la vista JSP para mostrarlos en una tabla.
     */
    @Override
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta)
            throws ServletException, IOException {

        List<Animal> listaAnimales = animalDAO.consultarTodosLosAnimales();

        peticion.setAttribute("listaAnimales", listaAnimales);

        RequestDispatcher vista = peticion.getRequestDispatcher("/listaAnimales.jsp");
        vista.forward(peticion, respuesta);
    }

    /**
     * Metodo POST: recibe los datos del formulario HTML de registro
     * (formularioAnimal.html), crea un nuevo Animal y lo inserta
     * mediante el DAO. Redirige a la pagina de confirmacion.
     */
    @Override
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta)
            throws ServletException, IOException {

        peticion.setCharacterEncoding("UTF-8");

        String arete = peticion.getParameter("arete");
        String nombre = peticion.getParameter("nombre");
        String sexo = peticion.getParameter("sexo");
        String fechaTexto = peticion.getParameter("fechaNacimiento");
        String idLoteTexto = peticion.getParameter("idLote");

        boolean datosValidos = arete != null && !arete.isBlank()
                && sexo != null && !sexo.isBlank()
                && fechaTexto != null && !fechaTexto.isBlank()
                && idLoteTexto != null && !idLoteTexto.isBlank();

        if (!datosValidos) {
            peticion.setAttribute("mensajeError", "Todos los campos obligatorios deben diligenciarse.");
            RequestDispatcher vistaError = peticion.getRequestDispatcher("/errorFormulario.jsp");
            vistaError.forward(peticion, respuesta);
            return;
        }

        LocalDate fechaNacimiento = LocalDate.parse(fechaTexto);
        int idLote = Integer.parseInt(idLoteTexto);

        Animal nuevoAnimal = new Animal(arete, nombre, sexo, fechaNacimiento, idLote);
        boolean exito = animalDAO.insertarAnimal(nuevoAnimal);

        peticion.setAttribute("exito", exito);
        peticion.setAttribute("animalRegistrado", nuevoAnimal);

        RequestDispatcher vista = peticion.getRequestDispatcher("/registroExitoso.jsp");
        vista.forward(peticion, respuesta);
    }
}
