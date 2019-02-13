<%-- 
    Document   : vista_error
    Created on : 12-jun-2018, 19:52:19
    Author     : Angel David
--%>

<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Información </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="js/funcionalidad.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            String msj = (String) session.getAttribute("msj");
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
                        <div class="col-md-6 offset-md-1">
                            <div class="alert alert-danger" role="alert">
                                <% out.print(msj);%>   
                            </div>
                            <div class="offset-md-3">
                                <a href="servlet_cargaDatos" class="btn btn-success" role="button"> Volver al Inicio </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
