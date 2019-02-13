

<%@page import="MODELO.Empresa"%>
<%@page import="MODELO.Estacion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FlixBus</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
        <script src="js/funcionalidad.js" type="text/javascript"></script>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <% ArrayList<Estacion> arrayEstaciones = (ArrayList<Estacion>)session.getAttribute("arrayEstaciones");%>
        <!-- Sacamos los datos de la empresa de session -->
        <% 
            Empresa objEmpresa = (Empresa)session.getAttribute("objEmpresa"); 
            session.setAttribute("option", "reservar");
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
    <main id="contenido">
        <section class="formulario_inicio">
            <form method="post" accept-charset="utf-8" action="servlet_buscarViaje">
                <label for="origen" class="label"> ORIGEN </label>
                                <select class="form-control" id="origen" name="origen">
                                    <option selected value="0" > Origen </option>
                                    <% for(int i=0 ; i<arrayEstaciones.size() ; i++) {

                                    %>  <option value="<% out.print(arrayEstaciones.get(i).getId()); %>"> <% out.print(arrayEstaciones.get(i).getLocalidad()); %></option>
                                    <%
                                        }
                                    %>
                                </select>                          
                                <br>  
                                <label for="destino" class="label"> DESTINO </label>
                                <select class="form-control" id="destino" name="destino">
                                    <option selected value="0" > Destino </option>
                                </select>
                                <br>

                                <label for="fecha" class="label"> Fecha </label>
                                <input class="form-control" type="date" id="fecha" name="fecha" value="2018-06-15" required>
                                <br>
                                
                                <label for="nBilletes" class="label"> Nº de billetes </label>
                                <input class="form-control" type="number" id="billetes" name="billetes" min="1" max="8" required>
                                <br>

                                <button type="submit" class="btn btn-success"> Buscar </button>
                            </form>
        </section>
        <section  class="carousel slide" data-ride="carousel">
            <div class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div id="carousel" class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Imagenes/Carouse/1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Imagenes/Carouse/2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Imagenes/Carouse/3.jpg" alt="Third slide">
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer id="footer_pagina">© 2000 - 2018 FLIXBUS.</footer>
</body>
</html>
