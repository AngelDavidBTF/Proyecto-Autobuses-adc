<%@page import="MODELO.ViajeSeleccionado"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccion Viaje</title>
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
         <div class="container-fluid">
        <form method="post" accept-charset="utf-8" action="ServletViajeSeleccion">
        <div class="tab-content" id="nav-tabContent" >
                            <div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab" style="width: 50%;margin:  0 auto;">
                                <div class="card text-center" id="tabla1">
                                    <div class="card-header">
                                        Numero de Personas: <strong><% out.print(S.getnBilletes());%></strong>
                                        <input type="text" name="nBilletes" hidden value="<% out.print(S.getnBilletes());%>">
                                        <input type="text" name="distancia" hidden value="<% out.print(S.getDistancia());%>">
                                    </div>
                                    <div class="row">
                                        <div class="card-body">
                                            <h5 class="card-title"> Fecha </h5>
                                            <p class="card-text"> <strong><% out.print(S.getFecha());%></strong> </p>
                                            <input type="text" name="fecha" hidden value="<% out.print(S.getFecha());%>">
                                        </div>
                                        
                                </div>
                                        <div class="row">
                                       <div class="card-body">
                                            <h5 class="card-title"> Origen - Destino:  </h5>
                                            <p class="card-text">  <strong><% out.print(S.getEstacionOrigen().getLocalidad()); %></strong> - <strong><% out.print(S.getEstacionDestino().getLocalidad()); %></strong> </p>
                                            <input type="text" name="origen" hidden value="<% out.print(S.getEstacionOrigen().getLocalidad()); %>">
                                            <input type="text" name="destino" hidden value="<% out.print(S.getEstacionDestino().getLocalidad()); %>">
                                       </div>
                                        
                                </div>
                                <br>
                            </div>
                        </div>
                                       <br>
        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab">
                                <% for (int i = 0; i < S.getViajes().size(); i++) {                       
                                %>
                                <div class="card text-center">
                                    <div class="card-header" id="<%out.print("horario" + i); %>">
                                        Horario <% out.print(i + 1); %>
                                    </div>
                                    <div class="row">
                                        <div class="card-body col-md-3">
                                            <h5 class="card-title"> Hora de Salida </h5>
                                            <p class="card-text"> <% out.print(S.getViajes().get(i).getHorario().getHora_salida()); %> </p>
                                            <input type="text" name="hSalida" id="input_hSalida" hidden value="<% out.print(S.getViajes().get(i).getHorario().getHora_salida()); %>">
                                        </div>
                                        <div class="card-body col-md-3">
                                            <h5 class="card-title"> Hora de Llegada </h5>
                                            <p class="card-text"> <% out.print(S.getViajes().get(i).getHorario().getHora_llegada()); %> </p>
                                            <input type="text" name="hLlegada" id="input_hLlegada" hidden value="<% out.print(S.getViajes().get(i).getHorario().getHora_llegada()); %>">
                                        </div>
                                        <div class="card-body col-md-2">
                                            <h5 class="card-title"> Plazas Libres </h5>
                                            <p class="card-text"> <% out.print(S.getViajes().get(i).getPlazas_ocupadas()); %>/8 </p>
                                            <input type="text" name="plazasOcupadas" id="input_plazasOcupadas" hidden value="<% out.print(S.getViajes().get(i).getPlazas_ocupadas()); %>">
                                        </div>
                                        <div class="card-body col-md-2">
                                            <h5 class="card-title"> Precio </h5>
                                            <p class="card-text"> <strong><% out.print(S.getPrecio());%>€ </strong> </p>
                                            <input type="text" name="idHorario" id="input_idHorario" hidden value="<% out.print(S.getViajes().get(i).getHorario().getId()); %>">
                                            <input type="number" name="precio" id="input_precio" hidden value="<% out.print(S.getnBilletes()*S.getPrecio()); %>" required>
                                        </div>
                                        <div class="card-body col-md-2 text-white">
                                            <button type="submit" class="btn btn-success"> Seleccionar </button>
                                        </div>
                                    </div>
                                    <div class="card-footer text-muted">
                                        Distancia: <% out.print(S.getDistancia()); %> Km
                                    </div>
                                    </div>
                                
                                    <br>
        
            <% } %>
            </div>
                    </div>
            </div>
            </form>
        </section>
    </main>
    <footer id="footer_pagina">© 2000 - 2018 FLIXBUS</footer>
    </body>
</html>
