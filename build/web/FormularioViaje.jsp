<%-- 
    Document   : FormularioViaje
    Created on : 12-jun-2018, 19:17:53
    Author     : Angel David
--%>

<%@page import="MODELO.Empresa"%>
<%@page import="MODELO.Estacion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Formulario BackUp </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/funcionalidad.js"></script>
    </head>
    <body>
        <%
            ArrayList<Estacion> arrayEstaciones = (ArrayList<Estacion>)session.getAttribute("arrayEstaciones");
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            session.setAttribute("option", "backup");
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="navBar">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
          <a class="navbar-brand" href="index.jsp">
            <img src="Imagenes/Logo.png" width="300" height="50" class="d-inline-block align-top" alt="">
            </a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item" >
                            <a class="nav-link" href="Vistas/contacto_vista.jsp">Contacto <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FormularioViaje.jsp">Viajar</a>
                        </li>
                    </ul>
                </div>
            </nav>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <br>
                        <div class="card offset-md-2 col-md-4 form-control formHome">
                        <div class="card-body">
                            <form method="post" accept-charset="utf-8" action="servlet_buscarViaje">
                                <select class="form-control form-control-lg" id="origen" name="origen">
                                    <option selected value="" > Origen </option>
                                    <% for(int i=0 ; i<arrayEstaciones.size() ; i++) {

                                    %>  <option value="<% out.print(arrayEstaciones.get(i).getId()); %>"> <% out.print(arrayEstaciones.get(i).getLocalidad()); %></option>
                                    <%
                                        }
                                    %>
                                </select>                          
                                <br>  

                                <select class="form-control form-control-lg" id="destino" name="destino">
                                    <option selected value="" > Destino </option>
                                </select>
                                <br>

                                <label for="fecha"> Seleciona fecha </label>
                                <input class="form-control" type="date" id="fecha" name="fecha" value="2018-06-15" required>
                                <br>
                                <a class="btn btn-secondary" reol="button" href="servlet_cargaDatos"> Atras </a>
                                <button type="submit" class="btn btn-success btn-lg"> Buscar Viajes </button>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
