<%-- 
    Document   : RegistroLogin
    Created on : 12-jun-2018, 0:27:14
    Author     : Angel David
--%>

<%@page import="MODELO.Viajero"%>
<%@page import="MODELO.Billete"%>
<%@page import="MODELO.Empresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login & Registro </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/funcionalidad.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
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
        <div class="contenido">
            <div class="container-fluid">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#login">Login</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#registro">Registro</a>
                  </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <div class="tab-pane container active" id="login">
                      <div class="row">
                    <div class="col-md-12">
                        <br>
                        <div class="row">
                            <div class="col-md-4 offset-md-1">
                                <form name="loginCliente" method="post" accept-charset="utf-8" action="ServletLogin">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <h5>
                                                Login
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="dni_login"> DNI </label>
                                                <input type="text" class="form-control" name="dni_login" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass_login"> Contraseña </label>
                                                <input type="password" class="form-control" name="pass_login" required>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-11 offset-md-3">
                                        <a href="vista_resumen.jsp" class="btn btn-secondary"> Atrás </a>
                                        <button type="submit" class="btn btn-success btn-lg"> Acceder </button>
                                    </div>
                                </form>
                            </div>
                            </div>
                        </div>
                      </div>
                  </div>
                    <div class="tab-pane container fade" id="registro">
                        <br>
                        <div class="col-md-5 offset-md-1">
                                
                                
                                <form name="loginCliente" method="post" accept-charset="utf-8" action="ServletRegistro">
                                    <div class="card">
                                        <div class="card-header text-center">
                                            <h5>
                                                Registro
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="dni"> DNI </label>
                                                <input type="text" class="form-control" name="dni" id="dni_registro" onBlur="comprobarDni('dni_registro','mensajedni_registro');" required>
                                                <div class="" id="mensajedni_registro"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass"> Contraseña </label>
                                                <input type="password" class="form-control" name="pass" id="pass" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="pass"> Repetir Contraseña </label>
                                                <input type="password" class="form-control" name="pass1" id="pass1" required onBlur="comprobarPass();">
                                                <div class="" id="mensajePass1"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nombre"> Nombre </label>
                                                <input type="text" class="form-control" name="nombre" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="apellidos"> Apellidos </label>
                                                <input type="text" class="form-control" name="apellidos" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion"> Dirección </label>
                                                <input type="text" class="form-control" name="direccion" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email"> Email </label>
                                                <input type="email" class="form-control" name="email" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="fecha_nac"> Fecha Nacimiento </label>
                                                <input type="date" class="form-control" name="fecha_nac" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="telefono"> Telefono </label>
                                                <input type="number" class="form-control" name="telefono" required>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-11 offset-md-4">
                                        <a href="vista_resumen.jsp" class="btn btn-secondary"> Atrás </a>
                                        <button type="submit" class="btn btn-success btn-lg"> Registrarse </button>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        </div><br><br>
            
    </body>
</html>
