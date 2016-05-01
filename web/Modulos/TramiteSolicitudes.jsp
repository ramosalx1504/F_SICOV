<%@page import="Beans.Solicitudes_Entrantes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<%
    HttpSession actual = request.getSession();
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("/F_SICOV/index.jsp");
    return;
    }
    if(!us.isMod_Solicitudes_adm())
    {
    response.sendRedirect("Main.jsp");
    return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SICOV</title>
        <!-- CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/mascaras-input.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine-es.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="js/moment-with-locales.js" type="text/javascript"></script>
        <script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <!-- Script -->
        <script> jQuery(document).ready(function(){jQuery("#form").validationEngine();}); </script>
        <script> jQuery(document).ready(function(){jQuery("#form1").validationEngine();}); </script>
           
        <script>
            jQuery(function($){
            //$("#date").mask("9999-99-99",{placeholder:"dd/mm/yyyy"});
            //$("#date2").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
            $("#telefono").mask("9999-9999? ext 9999");
            $("#cedula").mask("9-9999-9999");
            });
        </script>
        <%
        ArrayList<Solicitudes_Entrantes> listaBuzon = (ArrayList<Solicitudes_Entrantes>)request.getAttribute("listaBuzon");
        String trace = request.getParameter("trace");
        String resultado = "";
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
                                <% if(us.isMod_Solicitudes_adm()){%><li class="active"><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class=""><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
                                <% if(us.isMod_Vehiculos()){%><li class=""><a href="/F_SICOV/Modulos/Vehiculos.jsp">Vehículos</a></li><%}%>
                                <% if(us.isMod_Combustible()){%><li class=""><a href="/F_SICOV/Modulos/Combustible.jsp">Combustible</a></li><%}%>
                                <% if(us.isMod_Usuarios_sist()){%><li class=""><a href="../usuarios?code=0">Usuarios</a></li><%}%>
                            </ul>
                            <ul class="nav navbar-nav navbar-right ">
                                <li class=""><a> <% out.println(us.getUsername().toUpperCase()); %>  -  <span class="badge">0</span></a></li>
                                <li class="btn-salir"><a href="./Login?code=3"  type="submit" name="salir">Salir</a></li>  
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
                                                    <li><a href="Solicitudes.jsp">Solicitudes de Transporte</a></li>
                                                    <li><a href="/F_SICOV/solicitudes?code=6">Buzón de Solicitudes</a></li>
                                                    <li>Ver Solicitud</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="container">
                                    <%if( request.getAttribute("trace").equals("show") ){%>
                                    <% %>
                                    
                                    <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>
                                    <%}%>
                                </div>
                                <div class="container">
                                    <%if( request.getAttribute("trace").equals("tramite") ){%>
                                    <h3 class="page-header" >Trámite de solicitud número: </h3>
                                    
                                    
                                    <%}%>
                                </div>
                                
                                    <%if( request.getAttribute("trace").equals("default") ){%>
                                    <div class="container">
                                    <h3 class="page-header">Acción no válida!</h3>
                                    <a class="btn btn-default" href="/F_SICOV/solicitudes?code=6">Ir a buzón</a>
                                     </div>
                                    <%}%>
                                    <%if( request.getAttribute("trace").equals("success") ){%>
                                    <div class="container">
                                    <h3 class="page-header"><%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %></h3>
                                    <a class="btn btn-default" href="/F_SICOV/solicitudes?code=6">Ir a buzón</a>
                                     </div>
                                    <%}%>
                               
     <footer class="footer"><div class="container"><div class="footer-control"><p class="footer-text">Sistema de Gestión Vehicular SICOV, Solicitud de servicio de Transporte 6F36</p></div></div></footer>                                  
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>