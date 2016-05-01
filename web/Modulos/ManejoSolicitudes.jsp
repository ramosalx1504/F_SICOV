
<%@page import="Beans.Solicitud_Transporte"%>
<%@page import="Beans.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("../index.jsp");
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
            ArrayList<Solicitud> lista = (ArrayList<Solicitud>)request.getAttribute("lista");
            ArrayList<Solicitud_Transporte> listaDeneg = (ArrayList<Solicitud_Transporte>)request.getAttribute("listaDeneg");
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
                                <li class="btn-salir"><a href="./Login?code=3"  type="submit" name="salir">Salir</a></li>  
                            </ul>
                        </div>
                    </div>
                </nav>
        </header>
                                 <div class="container">
                                    <div class="cajon-principal">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <ol class="breadcrumb">
                                                    <li> </li>
                                                    <li><a href="index.html">Inicio</a></li>
                                                    <li>Usuarios</li>
                                            </ol>
                                        </div>
                                    </div>
                                    </div>
                                    
                                    
                                    <br>
                                    
        <div class="container main">
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
                <%for(int i=0;i<lista.size(); i++){%>
                
                <tr>
            
                    <td><%out.println(lista.get(i).getNumeroSolicitud());%></td>
                    <td><%out.println(lista.get(i).getFechaSalida());%></td>
                    <td><%out.println(lista.get(i).getDepartamento());%></td>
                    <td><a class="btn  btn-default" data-toggle="modal" data-target="#myModal">Ver</a></td>
                </tr>
                <%}%>
                </tbody>
            </table>                     
        </div>
                <hr class="divisor">
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='./Modulos/Solicitudes.jsp'">Volver</button>
            </div>
            
                <div class="modal fade" id="myModal" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
 
    </div>
    </div>
        <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>