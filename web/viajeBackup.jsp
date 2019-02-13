<%-- 
    Document   : viajeBackup
    Created on : 12-jun-2018, 19:29:21
    Author     : Angel David
--%>

<%@page import="MODELO.ViajeSeleccionado"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Formulario BackUp </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="js/funcionalidad.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            ViajeSeleccionado S = (ViajeSeleccionado) session.getAttribute("seleccionado");
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
                       
                        <table class="table">
                            <thead>
                              <tr>
                                  <th scope="col" colspan="3" class="text-center viajero"><h3>Información</h3></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td class="text-center">
                                    <b> Fecha: </b>
                                    <% out.print(S.getFecha()); %>
                                <td class="text-center">
                                    <b> Origen: </b>
                                    <% out.print(S.getEstacionOrigen().getLocalidad()); %>
                                </td>
                                <td class="text-center">
                                    <b> Destino: </b>
                                    <% out.print(S.getEstacionDestino().getLocalidad()); %> 
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        <br>
                        <form method="post" accept-charset="utf-8" action="ServletBackup">
                            <div class="tab-content row" id="nav-tabContent">

                                <div class="col-md-5 offset-md-1">
                                    <select class="form-control" name="select_viajeBackup">
                                        <% for (int i = 0; i < S.getViajes().size(); i++) {%>
                                        <option value="<% out.print(S.getViajes().get(i).getId_viaje());%>"> <% out.print("<b> Id: </b>" + S.getViajes().get(i).getId_viaje() + " Salida: " + S.getViajes().get(i).getHorario().getHora_salida() + " Llegada: " + S.getViajes().get(i).getHorario().getHora_llegada()); %> </option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="col-md-3 offset-md-0">
                                    <a class="btn btn-secondary" reol="button" href="FormularioViaje.jsp"> Atras </a>
                                    <button class="btn btn-warning" type="submit"> Confirmar Llegada </button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
