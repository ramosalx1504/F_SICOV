<%@page import="Beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("index.jsp?code=4");
    return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SICOV</title>
        <!-- CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <!-- js -->
    </head>
    
    <body>
        <header>
                <nav class="navbar navbar-fixed-top navbar-inverse">
                    <div class="container ">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1">
                                <span class="sr-only">Menú SICOV</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="/F_SICOV/Main.jsp" class="navbar-brand">SICOV</a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-1">
                            <ul class="nav navbar-nav">
                                <% if(us.isMod_Solicitudes_user() && !us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitud.jsp">Solicitar Servicio</a></li><%}%>
                                <% if(us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class=""><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
                                <% if(us.isMod_Vehiculos()){%><li class=""><a href="/F_SICOV/Modulos/Vehiculos.jsp">Vehículos</a></li><%}%>
                                <% if(us.isMod_Combustible()){%><li class=""><a href="/F_SICOV/Modulos/Combustible.jsp">Combustible</a></li><%}%>
                                <% if(us.isMod_Usuarios_sist()){%><li class=""><a href="./usuarios?code=0">Usuarios</a></li><%}%>
                            </ul>
                            <ul class="nav navbar-nav navbar-right ">
                                <li class=""><a> <% out.println(us.getUsername().toUpperCase()); %>  -  <span class="badge">0</span></a></li>
                                <li class="btn-salir"><a href="./Login?code=3"  type="submit" name="salir">Salir</a></li>  
                            </ul>
                        </div>
                    </div>
                </nav>
        </header>
    <!-- main -->                          
    <div class="container main">
        <%if(true){%> <%}%>
        
            <div class="cajon-principal">
            <div class="row">
                <%if(us.isMod_Solicitudes_adm()){%> 
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/documento.png" alt=""/>
                    <h3 class="text-center">Solicitudes</h3>
                    <p class="text-center">
                        Módulo encargado del manejo de solicitudes de transporte.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Solicitudes.jsp" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div><%}%>
                <%if(us.isMod_Solicitudes_user()&& !us.isMod_Solicitudes_adm()){%> 
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/solicitud.png" alt=""/>
                    <h3 class="text-center">Solicitud de Transporte</h3>
                    <p class="text-center">
                        Aquí puedes llenar un formulario para hacer la solicitud del servicio de transporte vehicular al departamento de recursos.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Solicitudes.jsp" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div><%}%>
                <%if(us.isMod_Solicitudes_user()&& !us.isMod_Solicitudes_adm()){%> 
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/car.png" alt=""/>
                    <h3 class="text-center">Estado de mis Solicitudes</h3>
                    <p class="text-center">
                        Módulo para revisar o cancelar una solicitud en trámite, también puede calificar aquí el servicio de transporte brindado recibido.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Solicitudes.jsp" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div><%}%>
                <%if(us.isMod_Vehiculos()){%>
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/car.png" alt=""/>
                    <h3 class="text-center">Vehículos</h3>
                    <p class="text-center">
                        Módulo encargado del matenimiento de expedientes vehiculares.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Vehiculos.jsp" class="btn btn-default center-block" role="button">Entrar »</a>
                    </p>
                </div><%}%>
                <%if(us.isMod_Usuarios_sist()){%>
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/chapu.png" alt=""/>
                    <h3 class="text-center">Usuarios</h3>
                    <p class="text-center">
                        Módulo para mantenimiento y edición de permisos de usuario dentro del sistema.
                    </p>
                    <p>
                        <a href="./usuarios?code=0" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div> <%}%>
            </div>
            <%if(!us.getDatabase_role().equalsIgnoreCase("user")){%><hr class="divisor"><%}%>
            <div class="row">
                <%if(us.isMod_Conductores()){%>
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/drive.png" alt=""/>
                    <h3 class="text-center">Conductores</h3>
                    <p class="text-center">
                        Módulo para ingresar y dar mantenimiento a los conductores.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Conductores.jsp" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div><%}%>
                 <%if(us.isMod_Conductores()){%>
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <img class="img-circle img-responsive marginauto" width="90" src="Media/gas.png" alt=""/>
                    <h3 class="text-center">Combustible</h3>
                    <p class="text-center">
                        Módulo encargado del gasto de combustible vehicular.
                    </p>
                    <p>
                        <a href="/F_SICOV/Modulos/Combustible.jsp" class="btn btn-default center-block" role="button">Entrar</a>
                    </p>
                </div><%}%>
            </div>    
            </div>
            
        </div><!--Fin Cont Main -->
                             
                        
    <footer class="footer"><div class="container"><div class="footer-control"><p class="footer-text">Sistema de Gestión Vehicular ,<a href="http://www.dgac.go.cr/">Dirección General de Aviación Civil</a> 2016.</p></div></div></footer>   
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
