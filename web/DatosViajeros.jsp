<%-- 
    Document   : DatosViajeros
    Created on : 10-jun-2018, 12:55:03
    Author     : Angel David
--%>

<%@page import="MODELO.ViajeSeleccionado"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Viajeros</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
        <script src="js/funcionalidad.js" type="text/javascript"></script>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
</head>
    <body>
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
        <%
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            ViajeSeleccionado S = (ViajeSeleccionado) session.getAttribute("seleccionado");
        %>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-9">
                        <br>
                        <h2>Rellene todos los formularios con los datos correctos</h2>
                        <br>
                        
                                    <form name="formularioViajeros" class="row" method="post" accept-charset="utf-8" action="ServletDatosViajeros">
                                        <div class="col-md-9 offset-md-1">
                                            <ul class="nav nav-pills">
                                        <% for (int i = 1; i <= S.getnBilletes(); i++) {%>
             
                                                <li class="nav-item">
                                                  <a class="nav-link" data-toggle="pill" href="#i<% out.print(i); %>">Información Viajero <% out.print(i); %></a>
                                                </li>
                                            <% } %>
                                            
                                        </ul>
                                            <div class="tab-content">
                                             <% for (int i = 1; i <= S.getnBilletes(); i++) {%>

                                                <div class="tab-pane container fade" id="i<% out.print(i); %>">
                                                <div class="form-group">
                                                                <label for="dni<% out.print(i); %>"> DNI </label>
                                                                <input type="text" class="form-control" id="dni<% out.print(i); %>" name="dni<% out.print(i); %>" onBlur="comprobarDni('dni<% out.print(i); %>','mensajedni_viajero');" required>
                                                                <div class="" id="mensajedni_viajero"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="nombre<% out.print(i); %>"> Nombre </label>
                                                                <input type="text" class="form-control" id="nombre<% out.print(i); %>" name="nombre<% out.print(i); %>" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="apellidos<% out.print(i); %>"> Apellidos </label>
                                                                <input type="text" class="form-control" id="apellidos<% out.print(i); %>" name="apellidos<% out.print(i); %>" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="fechaNac<% out.print(i); %>"> Fecha Nacimiento </label>
                                                                <input type="date" class="form-control" id="fechaNac<% out.print(i); %>" name="fechaNac<% out.print(i); %>" required>
                                                            </div>
                                                </div>
                                                
                        
                                              <% } %>
                                       
                                            
                                        </div>
                                        <div clas="col-md-2">
                                            <button type="submit" class="btn btn-primary" id="comprobar_infoPasajeros" hidden></button>
                                        </div>
                                    </form>
                                </div>
                            </div>                         
                        </div>
                    </div>
                    <div class="col-md-6" style="margin: 0 auto;">
                            <a href="vista_Seleccion_Viaje.jsp" class="btn btn-secondary"> Atrás </a>
                            <button onclick="continuar_infoPasajeros();" class="btn btn-success btn-lg"> Continuar </button><br><br>
                    </div>
                </div>
            </div>
        </div><br><br>

    </body>
</html>