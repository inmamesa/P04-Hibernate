<%-- 
    Document   : listaArticulos
    Created on : 29-may-2021, 13:18:56
    Author     : inmamesa98
--%>

<%@page import="model.Trabajadores"%>
<%@page import="model.Servicios"%>
<%@page import="dao.ServicioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/CSS/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Custom CSS Todas las páginas-->
        <link rel="stylesheet" type="text/css" href="./CSS/all.css">
        <!-- Custom CSS Index-->
        <!-- <link rel="stylesheet" type="text/css" href="assets/css/index.css"> -->

        <!-- Scripts Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </head>
        <body class="bg-secondary">
        <%
           Trabajadores trabActivo = (Trabajadores) request.getSession().getAttribute("sesionTrabajadores");
            String nombre = null;

            if (trabActivo != null) {
                nombre = trabActivo.getNombret() + " " + trabActivo.getApellidost();
            } else {
                response.sendRedirect("index.html");
            }
        %>

        <div class="pt-2">
            <nav class="navbar navbar-expand-lg navbar-dark text-center">
                <div class="container-fluid">
                    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse pt-4" id="navbarNavDropdown">

                        <ul class="navbar-nav">

                            <li class="nav-item">
                                <a class="nav-link active px-5" href="listaArticulos.jsp"><h2>Lista Articulos</h2></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  active px-5" href="listaTabla.jsp"><h2>Lista Tabla</h2></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  active px-5" href="Validacion.jsp"><h1>Cerrar Sesion</h1></a>
                            </li>
                            
                        </ul>

                    </div>
                </div>
            </nav>
            <section>
            <%
                ArrayList<Servicios> listaa=new ArrayList();
                ServicioDao pd=new ServicioDao();                           
                listaa = pd.getServicios();

                for (Servicios ser : listaa) {
            %>
            <article>
                
                <p><%=ser.toString()%></p>
                <figure><img class="centrar" src="./IMAGENES/<%=ser.getNombre()%>.jpg" /></figure>
            </article>
            <%
                }
            %>
        </section>                    
 </body>
</html>
