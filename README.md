# BovinNet - Modulo de animales (Servlets y JSP)

Evidencia: **GA7-220501096-AA2-EV02** — Modulos de software codificados
y probados (enfoque web con Servlets), segun el componente formativo
"Construccion de aplicaciones con JAVA".

## Descripcion

Este modulo expone por web las mismas operaciones de la entidad
**Animal** codificadas en la evidencia GA7-220501096-AA2-EV01 (que
usaba una consola con JDBC puro), esta vez a traves de:

- Un **formulario HTML** (`formularioAnimal.html`) para registrar un
  animal nuevo.
- Un **Servlet** (`AnimalServlet`) que atiende:
  - **GET** `/animales`: consulta y lista los animales registrados.
  - **POST** `/animales`: recibe los datos del formulario e inserta
    un nuevo animal.
- Vistas **JSP** para mostrar resultados dinamicos: `listaAnimales.jsp`,
  `registroExitoso.jsp` y `errorFormulario.jsp`.

## Artefactos de referencia usados

- **Diagrama de clases** y **modelo relacional** del proyecto (mismas
  clases `Animal`, `AnimalDAO`, `AnimalDAOImpl` y tabla `animal` de las
  evidencias GA6-220501096 y GA7-220501096-AA2-EV01).
- **Historia de usuario**: "Como operario de campo quiero registrar y
  consultar los animales del hato desde una pantalla web sencilla."
- **Prototipo de interfaz** (evidencias GA5-220501095): paleta de
  colores tierra/verde reutilizada en los formularios y vistas JSP.
- **Estandar de codificacion** (GA7-220501096-AA1-EV02): misma
  nomenclatura de paquetes, clases, metodos y variables.

## Elementos de JSP utilizados

- Directivas de pagina: `<%@ page contentType="..." import="..." %>`.
- Scriptlets: bloques `<% %>` para leer atributos de la peticion y
  recorrer listas con `for`.
- Expresiones: `<%= %>` para imprimir los valores de cada `Animal`.

## Flujo de la aplicacion

1. `index.html` redirige a `formularioAnimal.html`.
2. El formulario envia los datos por **POST** a `/animales`.
3. `AnimalServlet.doPost` valida, inserta con `AnimalDAOImpl` y
   reenvia a `registroExitoso.jsp` (o a `errorFormulario.jsp` si
   faltan datos obligatorios).
4. Desde cualquier vista, el enlace "Ver listado de animales" hace un
   **GET** a `/animales`, que `AnimalServlet.doGet` resuelve
   consultando la base de datos y mostrando `listaAnimales.jsp`.

## Estructura del proyecto

```
proyecto/
├── pom.xml
├── README.md
└── src/main/
    ├── java/co/sena/bovinnet/
    │   ├── animal/{Animal,AnimalDAO,AnimalDAOImpl}.java
    │   ├── util/ConexionBD.java
    │   └── web/AnimalServlet.java
    └── webapp/
        ├── index.html
        ├── formularioAnimal.html
        ├── listaAnimales.jsp
        ├── registroExitoso.jsp
        ├── errorFormulario.jsp
        └── WEB-INF/web.xml
```

## Requisitos para ejecutar

- JDK 17+, Maven 3.8+.
- Servidor de aplicaciones compatible con Servlets 4.0 / JSP 2.3
  (Apache Tomcat 9 es el recomendado).
- Base de datos `bovinnet` creada con el script de la evidencia
  GA6-220501096-AA2-EV02, y usuario/contrasena ajustados en
  `ConexionBD.java`.

## Compilacion y despliegue

```
mvn clean package
```

Esto genera `target/bovinnet-animal-web.war`. Copie ese archivo a la
carpeta `webapps/` de Apache Tomcat y acceda, con el servidor
iniciado, a:

```
http://localhost:8080/bovinnet-animal-web/
```

## Control de versiones

Proyecto versionado con Git. Ver `enlace_repositorio.txt` para la
direccion del repositorio remoto.
