<%-- 
    Document   : Resumen
    Created on : 11-jun-2018, 14:36:29
    Author     : Angel David
--%>

<%@page import="MODELO.ViajeroConAsiento"%>
<%@page import="MODELO.Empresa"%>
<%@page import="MODELO.Billete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Resumen Billete </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="funcionalidad/js.js"></script>
    </head>
    <body>
        <%
            Billete objBillete = (Billete) session.getAttribute("objBillete");
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
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
        <br>

        <div class="contenido">
            <div class="container">
                <table class="table">
            <thead>
              <tr>
                  <th scope="col" colspan="3" class="text-center viajero"><h3>Resumen Viaje</h3></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-center">
                    <b> Origen: </b>
                    <% out.print(objBillete.getObjSeleccionado().getEstacionOrigen().getLocalidad()); %></td>
                <td class="text-center">
                    <b> Destino: </b>
                    <% out.print(objBillete.getObjSeleccionado().getEstacionDestino().getLocalidad()); %>
                </td>
                <td class="text-center">
                    <b> Fecha: </b>
                    <% out.print(objBillete.getObjSeleccionado().getFecha());%> 
                </td>
              </tr>
            </tbody>
          </table>
                <br> <br>
          <table class="table">
            <thead>
              <tr>
                  <th scope="col" colspan="4" class="text-center viajero"><h3>Viajeros</h3></th>
              </tr>
            </thead>
            <tbody>
              <% for (int i = 0; i < objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().size(); i++) {%>                          
                <tr>
                    <td scope="row" colspan="4" class="text-center viajero1"><h5><% out.print("Viajero " + (i + 1) + ":");%></h5></td>
                </tr>
                <tr>
                    <td>
                        <b> DNI: </b>
                        <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getDni());%>
                    </td> 
                    <td>
                        <b> Nombre: </b>
                        <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getNombre());%>
                    </td>
                    <td>
                        <b> Apellidos: </b>
                        <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getApellidos());%>
                    </td>
                    <td>
                        <b> Nº Asiento: </b>
                        <% ViajeroConAsiento obj = (ViajeroConAsiento) objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i); out.print(obj.getnAsiento()); %>
                    </td>     
               <% }%>
            </tbody>
          </table>
            <br><br>
            <table class="table">
            <thead>
              <tr>
                  <th scope="col" colspan="2" class="text-center viajero"><h3>Horario</h3></th>
              </tr>
            </thead>
            <tbody>
              <tr class="text-center">
                <td>
                    <b> Hora Salida: </b>
                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getHorario().getHora_salida()); %>
                </td>
                <td>
                    <b> Hora Llegada: </b>
                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getHorario().getHora_llegada()); %>
                </td>
              </tr>
            </tbody>
          </table>
                <br> 
          <table class="table" style="width: 50%; margin: 0 auto;">
            <thead>
              <tr>
                  <th scope="col" class="text-center viajero"><h3>Precio</h3></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-center">
                    <p id="calculo">
                        <b><% out.print(objBillete.getObjSeleccionado().getPrecio() + " x " + objBillete.getObjSeleccionado().getnBilletes() + " Billetes = " + objBillete.getObjSeleccionado().getPrecio() * objBillete.getObjSeleccionado().getnBilletes() + "€"); %></b>
                    </p>
                </td>
              </tr>
              <tr>
                <td class="text-center">
                    <h4 id="precioTotal"> 
                    <div>
                        <% out.print("Precio Total " + objBillete.getObjSeleccionado().getPrecio() * objBillete.getObjSeleccionado().getnBilletes() + "€");%>                   
                    </div>                                            
                    </h4>
                    <input type="number" name="precio" id="input_precio" hidden value="">
                </td>
              </tr>
            </tbody>
          </table>
           <div class="col-md-6 offset-md-4">
                    <div class="offset-md-2">
                    <a href="SeleccionAsientos.jsp" class="btn btn-secondary col-md-2"> Atrás </a>
                    <a href="RegistroLogin.jsp" class="btn btn-success btn-lg"> Continuar </a><br><br>
                    </div>
           </div> 
            </div>    
    </body>
</html>
