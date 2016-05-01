<%@page import="Beans.Factura_Gasolina"%>
<%@page import="Beans.Usuario"%>
<%@page import="Beans.Conductor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Conexion.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession actual = request.getSession();
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("../index.jsp");
    return;
    }
    if(!us.isMod_Conductores())
    {
    response.sendRedirect("Main.jsp");
    return;
    }
    
    Consulta c = new Consulta();
    ArrayList<Factura_Gasolina> Lista = c.listarFacturas();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Conductores</title>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/jquery.validationEngine-es.js" type="text/javascript"></script>
        <script src="../js/jquery.validationEngine.js" type="text/javascript"></script>
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
                                <li class="btn-salir"><a href="../Login?code=3"  type="submit" name="salir">Salir</a></li>  
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
                            <li><a href="../Main.jsp">Inicio</a></li>
                            <li><a href="../Modulos/Combustible.jsp">Combustible</a></li>
                            <li>Lista de Facturas de Combustible</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="cajon-principal">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover text-center ">
                        <tr style="font-size: 0.85em">
                            <th class="text-center">Usuario</th>
                            <th class="text-center">Fecha Factura</th>
                            <th class="text-center">Placa</th>
                            <th class="text-center">Tipo de pago</th>
                            <th class="text-center">Número Tarjeta</th>
                            <th class="text-center">Número de factura</th>
                            <th class="text-center" style="width: 120px;">Monto Compra</th>
                            <th class="text-center">Cédula estación</th>
                            <th class="text-center">Nombre Estación</th>
                            <th class="text-center">Kilometraje</th>
                            <th class="text-center">Litros</th>
                        </tr>
                        <%                                               
                            for (int i = 0; i < Lista.size(); i++) {
                                out.print("<tr>"
                                        + "<td>" + Lista.get(i).getUsuario()+ "</td>"
                                        + "<td>" + Lista.get(i).getFechaRecibido()+ "</td>"
                                        + "<td>" + Lista.get(i).getPlacaVehiculo()+ "</td>"
                                        + "<td>" + Lista.get(i).getFormaPago()+ "</td>"
                                        + "<td>" );
                                       if(Lista.get(i).getFormaPago().equals("Tarjeta")){
                                           out.print(Lista.get(i).getNumeroTarjeta() );
                                       }else{
                                           out.print("--" );
                                       }
                                        out.print("</td>" +"<td>" + Lista.get(i).getNumeroFacturaCombustible()+ "</td>"
                                        + "<td>" + Lista.get(i).getMontoCompraCombustible()+ "</td>"
                                        + "<td>" + Lista.get(i).getCedulaEstacion()+ "</td>"
                                        + "<td>" + Lista.get(i).getNombreEstacion()+ "</td>"
                                        + "<td>" + Lista.get(i).getKilometraje()+ "</td>"
                                        + "<td>" + Lista.get(i).getLitros()+ "</td>"
                                        + "</tr>");
                            }
                        %>
                    </table>  
                </div>
            </div>
                    <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='/F_SICOV/Modulos/Combustible.jsp'">Volver</button>
            </div>
        </div>

        <script src="../js/bootstrap.min.js" type="text/javascript"></script>  
    </body>
</body>
</html>