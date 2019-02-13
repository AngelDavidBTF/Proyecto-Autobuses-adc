<%-- 
    Document   : vista_Billete
    Created on : 12-jun-2018, 1:52:43
    Author     : Angel David
--%>

<%@page import="MODELO.Empresa"%>
<%@page import="MODELO.Billete"%>
<%@page import="MODELO.ViajeroConAsiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Billete </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/js.js"></script>
    </head>
    <body>
        <%
            Billete objBillete = (Billete) session.getAttribute("objBillete");
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
        %>

        <div class="contenido">
            <div class="container-fluid">
                <div class="col-md-12">
                    <img src="./img/logo1.svg" width="300" style="margin: 10px;">
                </div>
                <div class="card bg-info border-info col-md-6 offset-md-3">
                    <div class="card-header text-white text-center">
                        <h5> Billete </h5>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="card-header text-center border-info">
                                <h6> Localizador: <% out.print(objBillete.getLocalizador());%>  </h6> 
                            </div>
                            <div class="col-md-12 card-body row">
                                <div class="col-md-4">
                                    <b> Origen: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getEstacionOrigen().getLocalidad()); %>                             
                                </div>

                                <div class="col-md-4">
                                    <b> Destino: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getEstacionDestino().getLocalidad()); %>            
                                </div>

                                <div class="col-md-4">
                                    <b> Fecha: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getFecha());%> 
                                </div>

                                <!--div class="col-md-4">
                                    <b> Nº Billetes: </b>
                                <% out.print(objBillete.getObjSeleccionado().getnBilletes());%>                   
                            </div-->
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="card-header text-center border-info">
                                <h6> Información Viajeros </h6>
                            </div>
                            <div class="col-md-12 card-body row">
                                <% for (int i = 0; i < objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().size(); i++) {%>                          
                                <div class="col-md-5 offset-md-1 border border-info">
                                    <h5 class="bg-info text-white text-center"><% out.print("Viajero " + (i + 1) + ":");%></h5>
                                    <b> DNI: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getDni());%>
                                    <br>
                                    <b> Nombre: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getNombre());%>
                                    <br>
                                    <b> Apellidos: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i).getApellidos());%>
                                    <br>
                                    <b> Nº Asiento: </b>
                                    <%
                                        ViajeroConAsiento obj = (ViajeroConAsiento) objBillete.getObjSeleccionado().getViajes().get(0).getViajeros().get(i);
                                        out.print(obj.getnAsiento());
                                    %>
                                    <br><br>
                                </div>      
                                <% }%>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="card-header text-center border-info">
                                <h6> Horario Seleccionado </h6>
                            </div>
                            <div class="col-md-12 card-body row">
                                <div class="col-md-4 offset-md-2">
                                    <b> Hora Salida: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getHorario().getHora_salida()); %>
                                </div>

                                <div class="col-md-5">
                                    <b> Hora Llegada: </b>
                                    <% out.print(objBillete.getObjSeleccionado().getViajes().get(0).getHorario().getHora_llegada()); %>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="card-header text-center border-info">
                                <h6> Datos Cliente </h6>
                            </div>
                            <div class="col-md-12 card-body row">
                                <div class="col-md-4 offset-md-1">
                                    <b> Dni: </b>
                                    <% out.print(objBillete.getCliente().getDni()); %>
                                </div>

                                <div class="col-md-6">
                                    <b> Cliente: </b>
                                    <% out.print(objBillete.getCliente().getNombre() + " " + objBillete.getCliente().getApellidos()); %>
                                </div>
                                <br><br>
                                <div class="col-md-4 offset-md-1">
                                    <b> Tel: </b>
                                    <% out.print(objBillete.getCliente().getTelefono()); %>
                                </div>

                                <div class="col-md-6">
                                    <b> Email: </b>
                                    <% out.print(objBillete.getCliente().getEmail()); %>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item bg-info text-white text-center">
                            <p id="calculo">
                                <% out.print(objBillete.getObjSeleccionado().getPrecio() + " x " + objBillete.getObjSeleccionado().getnBilletes() + " Billetes = " + objBillete.getObjSeleccionado().getPrecio() * objBillete.getObjSeleccionado().getnBilletes() + "€"); %>
                            </p>
                            <h4 id="precioTotal"> 
                                <div>
                                    <% out.print("Precio Total " + objBillete.getObjSeleccionado().getPrecio() * objBillete.getObjSeleccionado().getnBilletes() + "€");%>                   
                                </div>                                            
                            </h4>
                            <input type="number" name="precio" id="input_precio" hidden value="">
                        </li>
                    </ul>
                </div><br>
                <div class="col-md-6 offset-md-4">
                    <div class="offset-md-2">
                    <a href="servlet_preHome" class="btn btn-primary col-md-4"> Volver al Inicio </a><br><br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
