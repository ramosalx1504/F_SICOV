<%@page import="Beans.Factura_Gasolina"%>
<%@page import="Beans.Accesorios_Vehiculo"%>
<%@page import="Beans.Vehiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("/F_SICOV/index.jsp");
    return;
    }
    if(!us.isMod_Vehiculos())
    {
    response.sendRedirect("Main.jsp");
    return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Expediente</title>
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
        ArrayList<Vehiculo> lista = (ArrayList<Vehiculo>)request.getAttribute("vehiculo");
        ArrayList<Accesorios_Vehiculo> listaA = (ArrayList<Accesorios_Vehiculo>)request.getAttribute("accesorios");
        ArrayList<Factura_Gasolina> listaG = (ArrayList<Factura_Gasolina>)request.getAttribute("facturas");
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
                                <% if(us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class=""><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
                                <% if(us.isMod_Vehiculos()){%><li class="active"><a href="/F_SICOV/Modulos/Vehiculos.jsp">Vehículos</a></li><%}%>
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
                <li><a href="./ExpedienteVehiculo?trace=search">Buscar por Placa<span class="pull-right hidden-xs glyphicon glyphicon-search"></span></a></li>
                <%if( request.getAttribute("resultado").equals("Encontrado") ){%>
                <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="dropdown">Expediente<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs glyphicon glyphicon-folder-close"></span></a>
                  <ul class="dropdown-menu forAnimate" role="menu">
                    <li><a href="#">Ficha Técnica</a></li>
                    <li><a >Accesorios</a></li>
                    <li><a href="#">Facturas Combustible</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Informes</a></li>
                <%}%>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
                                <div class="container col-md-offset-2">
                                    <div class="container-fluid">
                                        
                                        <div class="row main-dashboard">
                                        <%if( request.getAttribute("resultado").equals("Encontrado") && request.getAttribute("trace").equals("show") ){%>
                                            <div style="padding: 0" class="container-fluid">
                                                <h4 class="page-header">Expediente del Vehículo: <span style="color: green"><%out.println(lista.get(0).getPlaca());%></span> </h4>
                                                                        <ul class="nav nav-tabs">
                                                                          <li class="active"><a data-toggle="tab" href="#home">Ficha Técnica</a></li>
                                                                          <li><a data-toggle="tab" href="#menu1">Accesorios</a></li>
                                                                          <li><a data-toggle="tab" href="#menu2">Facturas de Combustible</a></li>
                                                                          <li><a data-toggle="tab" href="#menu3">Fotos del Vehículo</a></li>
                                                                        </ul>

                                                                        <div class="tab-content">
                                                                          <div id="home" class="tab-pane fade in active">
                                                                              <br>  
                                                                        <div class="row">
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Número de Placa: </label>
                                                                        <input name="placa" type="text" value="<%out.println(lista.get(0).getPlaca());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Número de Chasis: </label>
                                                                        <input name="chasis" type="text" value="<%out.println(lista.get(0).getChasis());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Número de Motor: </label>
                                                                        <input name="motor" type="text" value="<%out.println(lista.get(0).getMotor());%>" class="form-control" readonly>
                                                                        </div>
                                                                        </div>
                                                                        <div class="row">
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Tomo: </label>
                                                                        <input name="tomo" type="text" value="<%out.println(lista.get(0).getTomo());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Folio: </label>
                                                                        <input name="folio" type="text" value="<%out.println(lista.get(0).getFolio());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Asiento: </label>
                                                                        <input name="asiento" type="text" value="<%out.println(lista.get(0).getAsiento());%>" class="form-control" readonly>
                                                                        </div>
                                                                        </div>
                                                                        <div class="row">
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Marca: </label>
                                                                        <input name="marca" type="text" value="<%out.println(lista.get(0).getMarca());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Modelo: </label>
                                                                        <input name="modelo" type="text" value="<%out.println(lista.get(0).getModelo());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Estilo: </label>
                                                                        <input name="estilo" type="text" value="<%out.println(lista.get(0).getEstilo());%>" class="form-control" readonly>
                                                                        </div>
                                                                        </div>
                                                                        <div class="row">
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Color: </label>
                                                                        <input name="color" type="text" value="<%out.println(lista.get(0).getColor());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Año: </label>
                                                                        <input name="year" type="text" value="<%out.println(lista.get(0).getYearVehiculo());%>" class="form-control" readonly>
                                                                        </div>
                                                                        <div class="col-sm-4 form-group">
                                                                        <label>Cilindrada: </label>
                                                                        <input id="cc" name="cilindrada" type="text" value="<%out.println(lista.get(0).getCilindrada());%>" class="form-control" readonly>
                                                                        </div>
                                                                        </div>
                                                                              
                                                                          </div>
                                                                          <div id="menu1" class="tab-pane fade">
                                                                              
                                                                              <table class="table table-striped table-responsive">
                                                                                  <tr>
                                                                                      <th>Nombre del Accesorio</th>
                                                                                      <th>Descripción</th>
                                                                                  </tr>
                                                                              <% if(listaA.isEmpty()){ out.print("<p> Vehículo no cuenta con Accesorios </p>"); } 
                                                                                else
                                                                                {
                                                                                    for(int i = 0; i < listaA.size(); i++)
                                                                                    {
                                                                                        
                                                                                        out.print("<tr>");
                                                                                        out.print("<td>"+listaA.get(i).getNombreAccesorio()+"</td>");
                                                                                        out.print("<td>"+listaA.get(i).getDescrip()+"</td>");
                                                                                        out.print("</tr>");
                                                                                    }
                                                                                }
                                                                              %>
                                                                              </table>
                                                                              </div>
                                                                          <div id="menu2" class="tab-pane fade">
                                                                              
                                                                            <%
                                                                              if(listaG.isEmpty()){
                                                                                  out.print("<p>Vehículo no cuenta con facturas de combustible</p>");
                                                                              }
                                                                              else
                                                                              {
                                                                                  out.print("<table class ='table table-striped'><tr><th>Fecha</th><th>Tipo de Pago</th><th>Número de Factura</th><th>Monto</th><th>Acciones</th></tr>");
                                                                                  for(int i = 0; i< listaG.size();i++)
                                                                                  {
                                                                                  out.print("<tr>");
                                                                                  out.print("<td>"+listaG.get(i).getFechaFacturaCombustible()+"</td>");
                                                                                  out.print("<td>"+listaG.get(i).getFormaPago()+"</td>");
                                                                                  out.print("<td>"+listaG.get(i).getNumeroFacturaCombustible()+"</td>");
                                                                                  out.print("<td>"+listaG.get(i).getMontoCompraCombustible()+"</td>");
                                                                                  out.print("<td><a href'#'>Ver foto</a></td>");
                                                                                  out.print("</tr>");
                                                                                  }
                                                                                  out.print("</table>");
                                                                              }
                                                                            %>
                                                                            
                                                                          </div>
                                                                          <div id="menu3" class="tab-pane fade">
                                                                            
                                                                            
                                                                          </div>
                                                                        </div>
                                                                            
                                            </div><!--FinExpedinte-->
                                            <%}else{%>
                                            
                                            <div class="row">
                                                <h4 class="page-header">Bienvenido al módulo de expediente Vehicular</h4>
                                            </div>
                                            
                                            
                                            <%= request.getAttribute("error") == null ? "": request.getAttribute("error") %>
                                            <%= request.getAttribute("formulario") == null ? "": request.getAttribute("formulario") %>
                                            
                                            <%}%>
                                            
                                            
                                            
                                    </div><!--Fin Marco de trabajo-->
</div>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
