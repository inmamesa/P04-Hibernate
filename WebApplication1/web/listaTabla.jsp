<%-- 
    Document   : listaTabla
    Created on : 31-may-2021, 15:41:27
    Author     : inmamesa98
--%>

<%@page import="model.Servicios"%>
<%@page import="dao.ServicioDao"%>
<%@page import="dao.TrabajadoresDao"%>
<%@page import="model.Trabajadores"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <body class="bg-secondary" >
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
            <div>    
                <div>
                    <section class="section-content p-3 text-center">
                        <table class="table pt-5">
                            <thead >
                                <tr style="color:purple">
                                    <th scope="col" class="tabletitles">NUMERO</th>
                                    <th scope="col" class="tabletitles">NOMBRE</th>
                                    <th scope="col" class="tabletitles">PRECIO</th>
                                    <th scope="col" class="tabletitles">TRABAJADOR</th>
                                    <th scope="col" class="tabletitles">IMAGEN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test='${param.nombre == null}'>
                                         <form style="color:white; margin-top: -2%" class="text-center pr-5 pb-4 pl-5">
                                            <br><br>
                                            <select name="nombre">
                                                <option value="corte pelo">corte pelo</option>
                                                <option value="vacunas">vacunas</option>
                                                <option value="limpieza uñas">limpieza uñas</option>
                                                <option value="lavado">lavado</option>
                                            </select>
                                            <br>
                                            <input type="submit" value="Filtrar por Nombre"/>
            
                                        </form>    
                                         <hr>
                                        <%     
                                            ArrayList<Servicios> lista=new ArrayList();
                                            ServicioDao pm=new ServicioDao();
                                            lista=pm.getServicios();
                                            
                                            for (int i=0 ; i < lista.size();i++) {
                                                int numeroServicio = lista.get(i).getNumeroservicio();
                                                String nombr = lista.get(i).getNombre();
                                                int precio = lista.get(i).getPrecio();
                                                int idT = lista.get(i).getIdt();
                                                String imagen=lista.get(i).getImagen();

                                        %>
                                        <tr style="color: white">
                                            <th scope="row" class="tableinfo">
                                                <%=numeroServicio%>
                                            </th>
                                            <td class="tableinfo">
                                                <%=nombr%>
                                            </td>
                                            <td class="tableinfo">
                                                <%=precio%>
                                            </td> 
                                            <td class="tableinfo">
                                                <%=idT%>
                                            </td>
                                            <td class="tableinfo">
                                                <a href="./IMAGENES/<%=nombr%>.jpg" target="_blank">Imagen</a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                   
                                </c:when>
                                    <c:when test='${param.nombre != null}'>
                                         <form style="color:white; margin-top: -2%" class="text-center pr-5 pb-4 pl-5">
                                            <br><br>
                                            <select name="nombre">
                                                <option value="corte pelo">corte pelo</option>
                                                <option value="vacunas">vacunas</option>
                                                <option value="limpieza uñas ">limpieza uñas</option>
                                                <option value="lavado">lavado</option>
                                            </select>
                                            <br>
                                            <input type="submit" value="Filtrar por Nombre"/>
            
                                        </form>   
                                         <hr>
                                        <%     
                                            String porNombre = request.getParameter("nombre");
                                            ArrayList<Servicios> listaa=new ArrayList();
                                            ServicioDao pd=new ServicioDao();
      
                                            listaa=pd.getServiciodos(porNombre);
                                            
                                            for (int i=0 ; i < listaa.size();i++) {
                                                int numeroServicio = listaa.get(i).getNumeroservicio();
                                                String nombr = listaa.get(i).getNombre();
                                                int precio = listaa.get(i).getPrecio();
                                                int idT = listaa.get(i).getIdt();
                                                String imagen=listaa.get(i).getImagen();

                                        %>
                                        <tr style="color: white">
                                            <th scope="row" class="tableinfo">
                                                <%=numeroServicio%>
                                            </th>
                                            <td class="tableinfo">
                                                <%=nombr%>
                                            </td>
                                            <td class="tableinfo">
                                                <%=precio%>
                                            </td> 
                                            <td class="tableinfo">
                                                <%=idT%>
                                            </td>
                                            <td class="tableinfo">
                                                <a href="./IMAGENES/<%=nombr%>.jpg" target="_blank">Imagen</a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                         
                        
                        
                </c:when>
                                        
            </c:choose>
                    </tbody>
                    </table>
                    </section>
                </div>
            </div>
            
                            
 </body>
</html>

