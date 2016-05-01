<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<%
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("../index.jsp");
    return;
    }
    if(!us.isMod_Usuarios_sist())
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
    ArrayList<Usuario> lista = (ArrayList<Usuario>)request.getAttribute("lista");
    String codigo = request.getParameter("code");
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
                                <% if(us.isMod_Combustible()){%><li class=""><a href="/F_SICOV/Modulos/Combustible.jsp">Combustible</a></li><%}%>
                                <% if(us.isMod_Usuarios_sist()){%><li class="active"><a href="./usuarios?code=0">Usuarios</a></li><%}%>
                            </ul>
                            <ul class="nav navbar-nav navbar-right ">
                                <li class=""><a> <% out.println(us.getUsername().toUpperCase()); %>  -  <span class="badge">0</span></a></li>
                                <li class="btn-salir"><a href="./Login?code=3"  type="submit" name="salir">Salir</a></li>  
                            </ul>
                        </div>
                    </div>
                </nav>
        </header>
        
        <nav class="navbar navbar-default sidebar col-md-2 col-sm-2 col-xs-1" role="navigation">
            <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>      
            </div>
            <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
              <ul class="nav navbar-nav md">
                <li class="active"><a href="#">Menú<span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-list"></span></a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                  <ul class="dropdown-menu forAnimate" role="menu">
                    <li><a href="#">Crear(Pronto)</a></li>
                    <li><a href="./usuarios?code=1">Modificar</a></li>
                    <li><a href="#">Reportar</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Informes</a></li>
                  </ul>
                </li>
                <li><a href="./usuarios?code=1">Buscar Usuario específico</a></li>
                <li><a href="./usuarios?code=2">Ver todos los Usuarios</a></li>
              </ul>
            </div>
          </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-10 col-md-offset-2 main-dashboard">
                    <h3 class="page-header">Mantenimiento de Usuarios</h3>
                        <div class="row main-dashboard">
                            
                            <%if(codigo.equals("2")){%>
                            <div class="col-md-12">
                                <div class="cajon-principal">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr>
                                                <th>Usuario</th>
                                                <th>Acciones</th>
                                            </tr>
                                            <%for(int i=0;i<lista.size();i++){%>
                                            <tr>
                                                <td><%out.println(lista.get(i).getUsername());%></td>
                                                <td><a class="btn btn-primary">Modificar Permisos</a></td>
                                            </tr>
                                            <%}%>
                                        </table><%}%>
                                    </div>
                                </div>
                            </div><!-- Fin contenedor Tabla -->
                            <div class="main-dashboard col-md-offset-2">
                                <%if(codigo.equals("0") | codigo.equals("3")) {%> <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>  <%}%>
                                <%if(codigo.equals("1") && !request.getAttribute("resultado").equals("Encontrado") ){%> <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %> <%}%>
                                <%if(!codigo.equals("0") && !codigo.equals("1") && !codigo.equals("3") ) {%> <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>  <%}%>
                            </div>
                            
                            <div class="col-md-offset-2">
                                <%if(codigo.equals("1") && request.getAttribute("resultado").equals("Encontrado") ){%>
                                <div class="container">
                                    <div class="row ">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-sm-offset-2 col-md-offset-2 main">
                                            <div class="panel panel-default">
                                                <form id="f1"  action="set_rol" method="POST">
                                                <input name="uedit" type="text" value="<%out.println(lista.get(0).getUsername());%>" hidden >
                                                <div class="panel-heading">Asigne los permisos al usuario : <span style="color: green;padding-left: 15px;"><%out.println(lista.get(0).getUsername().toUpperCase());%></span></div>

                                                <ul class="list-group">
                                                    <li class="list-group-item" style="border-top-width: 1px !important">
                                                        Acceso a Solicitudes como Administrador
                                                        <div class="material-switch pull-right">
                                                            <input id="sadm" name="sadm" type="checkbox"  <%if(lista.get(0).isMod_Solicitudes_adm()){out.println("checked='on'");}%>/>
                                                            <label for="sadm" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        Acceso a Solicitudes como usuario Normal
                                                        <div class="material-switch pull-right">
                                                            <input id="suser" name="suser" type="checkbox" <%if(lista.get(0).isMod_Solicitudes_user()){out.println("checked='on'");}%> />
                                                            <label for="suser" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        Acceso a Vehículos
                                                        <div class="material-switch pull-right">
                                                            <input id="vh" name="vh" type="checkbox" <%if(lista.get(0).isMod_Vehiculos()){out.println("checked='on'");}%>/>
                                                            <label for="vh" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        Acceso a Conductores
                                                        <div class="material-switch pull-right">
                                                            <input id="cn" name="cn" type="checkbox" <%if(lista.get(0).isMod_Conductores()){out.println("checked='on'");}%>/>
                                                            <label for="cn" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        Acceso a Combustible
                                                        <div class="material-switch pull-right">
                                                            <input id="cm" name="cm" type="checkbox" <%if(lista.get(0).isMod_Combustible()){out.println("checked='on'");}%>/>
                                                            <label for="cm" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        Acceso a Roles de Usuario
                                                        <div class="material-switch pull-right">
                                                            <input id="ruser" name="ruser" type="checkbox" <%if(lista.get(0).isMod_Usuarios_sist()){out.println("checked='on'");}%>/>
                                                            <label for="ruser" class="label-success"></label>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item"  >
                                                        <a type="button" href="#confirmacion"  class="btn btn-primary" style="width: 100%" data-toggle="modal">Guardar</a>
                                                    </li>
                                                </ul>
                                                <div class="modal fade" id="confirmacion">
                                                   <div class="modal-dialog">
                                                       <div class="modal-content alert alert-warning" role="alert">
                                                          <div class="modal-body">
                                                            <h4> Confirma que desea continuar con la operación? </h4> 
                                                           </div>
                                                          <div class="modal-footer">
                                                               <button type="button" class="btn btn-primary" data-dismiss="modal">Volver!</button>
                                                               <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                                          </div>
                                                       </div>
                                                    </div>
                                                </div>
                                                </form>
                                            </div>            
                                        </div>
                                    </div>
                                               
                                </div>
                                <%}%>
                            </div>
                            
                    </div>
                </div>
            </div>
        </div>
                                        
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
