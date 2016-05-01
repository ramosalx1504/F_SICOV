<%@page import="Beans.Solicitudes_Entrantes"%>
<%@page import="Beans.Solicitud_Transporte"%>
<%@page import="Beans.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("/F_SICOV/index.jsp");
    return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SICOV</title>
        <!-- CSS -->
        <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine-es.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
        <!-- Script -->
        <script> jQuery(document).ready(function(){jQuery("#formLOGIN").validationEngine();}); </script>
        <%
            Usuario us = (Usuario) request.getSession().getAttribute("usuario");
            ArrayList<Solicitudes_Entrantes> listaBuzon = (ArrayList<Solicitudes_Entrantes>)request.getAttribute("listaBuzon"); 
        %>
    </head>
    <body>
        <header>
                <nav class="navbar navbar-fixed-top navbar-inverse">
                    <div class="container">
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
                                <% if(us.isMod_Combustible()){%><li class=""><a href="/F_SICOV/Modulos/Combustible.jsp">Control de Combustible</a></li><%}%>
                                <% if(us.isMod_Usuarios_sist()){%><li class=""><a href="./usuarios?code=0">Usuarios</a></li><%}%>
                            </ul>
                            <ul class="nav navbar-nav navbar-right ">
                                <li class=""><a> <% out.println(us.getUsername().toUpperCase()); %>  -  <span class="badge">0</span></a></li>
                                <li class="btn-salir"><a href="/F_SICOV/Login?code=3"  type="submit" name="salir">Salir</a></li>  
                            </ul>
                        </div>
                    </div>
                </nav>
        </header>
                                <div style="padding-top: 15px" class="container">
                                    
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <ol class="breadcrumb">
                                                    <li> </li>
                                                    <li><a href="/F_SICOV/Main.jsp">Inicio</a></li>
                                                    <li><a href="./Modulos/Solicitudes.jsp">Solicitudes de Transporte</a></li>
                                                    <li>Buzón de Solicitudes</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                    
                                    
                                    <br>
                                    
        <div class="container main">
            <%if(listaBuzon.isEmpty()){%>
            <h3 class="page-header">¡No hay solicitudes pendientes!</h3>
            <%}else{%>
            <table class="table table-striped" name="buzon" id="tblGrid">
                <thead id="tblHead"> 
                <tr>
                    <th>Nombre de usuario</th>
                    <th>Fecha de Solicitud</th>
                    <th>Departamento</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%for(int i=0;i<listaBuzon.size(); i++){%>
                <tr>
                    <td><%out.println(listaBuzon.get(i).getEncargado());%></td>
                    <td><%out.println(listaBuzon.get(i).getFechaSalida());%></td>
                    <td><%out.println(listaBuzon.get(i).getFechaRegreso());%></td>
                    <td><a  href="./Buzon?trace=show&id=<%out.println(listaBuzon.get(i).getNumero());%>" class="btn  btn-default">Ver</a></td>
                </tr>
                <%}%>
                </tbody>
                <input type="text" hidden id="seleccion">
            </table>
                <hr class="divisor">
                <%}%>
        </div>
                
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='./Modulos/Solicitudes.jsp'">Volver</button>
            </div>
                <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>

