<%-- 
    Document   : SeleccionAsientos
    Created on : 11-jun-2018, 14:04:05
    Author     : Angel David
--%>

<%@page import="MODELO.Viajero"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODELO.Billete"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Información Viajeros </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/funcionalidad.js"></script>
    </head>
    <body>
        <%
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            Billete objBillete = (Billete) session.getAttribute("objBillete");
            ArrayList<Viajero> arrayViajerosNuevos = (ArrayList<Viajero>) session.getAttribute("arrayViajerosNuevos");
            ArrayList<Integer> array_plazasLibres = (ArrayList<Integer>) session.getAttribute("array_plazasLibres");
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
                    <div class="col-md-9">
                        <br>
                        <h2>Seleccione el número de asiento de cada pasajero</h2>
                        <br>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-3" role="tabpanel" aria-labelledby="nav-3-tab">
                                <div class="col-md-5 offset-md-1">
                                    <div class="card">
                                        <div class="card-body">
                                            <form name="formularioAsientos" method="post" accept-charset="utf-8" action="ServletAsientos">
                                                <div class="form-group row col-md-12">
                                                    <% for (int i = 0; i < objBillete.getObjSeleccionado().getnBilletes(); i++) {%>

                                                    <%
                                                        String nombre = arrayViajerosNuevos.get(i).getNombre();
                                                    %>

                                                    <label id="nombrePasajero<% out.print(i); %>" class="col-md-7 col-form-label"><p><% out.print(nombre); %> </p></label>
                                                    <div class="col-md-5">
                                                        <select class="form-control" onchange="select_asiento('<% out.print(array_plazasLibres); %>');" id="selectViajero<% out.print(i); %>" name="asiento<% out.print(i); %>">
                                                            <% for (int j = 0; j < array_plazasLibres.size(); j++) {%>

                                                            <option value="<% out.print(array_plazasLibres.get(j)); %>"><% out.print(array_plazasLibres.get(j)); %> </option>
                                                            <% } %>
                                                        </select>
                                                    </div>
                                                    <br>
                                                    <% } %>
                                                </div>
                                                <button type="submit" class="btn btn-primary" id="comprobar_selecAsientos" hidden></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5" style="margin: 0 auto;">
                        <br>
                        <a href="DatosViajeros.jsp" class="btn btn-secondary"> Atrás </a>
                        <button onclick="continuar_selecAsientos('<% out.print(objBillete.getObjSeleccionado().getnBilletes());%>');" class="btn btn-success btn-lg"> Continuar </button><br><br> 
                    </div>
                </div>
            </div>
        </div><br><br>
    </body>
</html>
