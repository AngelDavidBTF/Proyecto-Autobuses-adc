<%-- 
    Document   : SeleccionTarjeta
    Created on : 12-jun-2018, 1:18:48
    Author     : Angel David
--%>

<%@page import="MODELO.Tarjeta"%>
<%@page import="MODELO.Billete"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Selecionar Tarjeta </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/funcionalidad.js"></script>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <%
            Empresa objEmpresa = (Empresa) session.getAttribute("objEmpresa");
            Billete objBillete = (Billete) session.getAttribute("objBillete");
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                       
                        <br>
                        <div class="row">
                            <div class="col-md-9 offset-md-1">
                                <form name="loginCliente" method="post" accept-charset="utf-8" action="ServletSeleccionTarjeta">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <h5>
                                                Tarjetas Disponibles
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-12">
                                                <% if (objBillete.getCliente().getArray_tarjetas().size() > 0) {%>
                                                <div class="form-group col-md-12">
                                                    <select class="form-control" id="select_tarjetaCliente" name="select_tarjetaCliente">
                                                        <% for (int i = 0; i < objBillete.getCliente().getArray_tarjetas().size(); i++) {
                                                                Tarjeta objTarjeta = objBillete.getCliente().getArray_tarjetas().get(i);
                                                        %>
                                                        <option value="<% out.print(objTarjeta.getNumero());%>"><% out.print(objTarjeta.getNumero());%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="cvv"> CVV </label>
                                                    <input type="password" class="form-control" name="cvv_select" maxlength="3" required>
                                                </div>

                                                <% } else { %>

                                                <div class="alert alert-secondary" role = "alert"> 
                                                    <strong> No hay tarjetas registradas:</strong> Rellene el formulario para dar de alta una
                                                </div >
                                                <% }%>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-11 offset-md-3">
                                        <% if (objBillete.getCliente().getArray_tarjetas().size() > 0) {%>
                                        <a href="RegistroLogin.jsp" class="btn btn-secondary col-md-2"> Atrás </a>
                                        <button type="submit" class="btn btn-success col-md-4 btn-lg"> Selecionar </button>
                                        <% }%>
                                    </div>
                                </form>
                            </div>
                        </div>
                                <br>  
                       <div class="row">
                            <div class="col-md-9 offset-md-1">
                                <form name="registroTarjeta" method="post" accept-charset="utf-8" action="ServletRegistroTarjeta">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <h5>
                                                Registro de tarjetas
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="nTarjeta"> Nº de Tarjeta </label>
                                                <input type="number" class="form-control" name="nTarjeta"  placeholder="1234 5678 9012 3456" maxlength="16"required>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-8">
                                                    <label for="caducidad"> Caducidad </label>
                                                    <input type="date" class="form-control" name="caducidad" required>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="cvv"> CVV </label>
                                                    <input type="password" class="form-control" name="cvv"  maxlength="3" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-11 offset-md-4">
                                        <a href="RegistroLogin.jsp" class="btn btn-secondary col-md-2"> Atrás </a>
                                        <button type="submit" class="btn btn-success col-md-4 btn-lg"> Registrar </button>
                                    </div>
                                </form>
                            </div>               
                        </div>
     
                    </div>
                </div>
</div><br><br>



</div>
</body>
</html>
