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
    ArrayList<Conductor> Lista = c.Listaconductores();

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
        <script> jQuery(document).ready(function () {
                jQuery("#form").validationEngine();
            });</script>
    </head>
    <body>
            <%
            out.print(c.GenerarScripttCompleto1(c.Listaconductores()));
            %>
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
                            <li><a href="../Modulos/Conductores.jsp">Conductores</a></li>
                            <li>Buscar algun Conductor</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="cajon-principal">
                <div class="table-responsive">
                    <label for="duracion" class="control-label col-md-2"> Ced&#250la:<br></label> 
                    <select id='conductor' onchange="num1()" name="cedula">
                        <%                                                for (int j = 0; j < Lista.size(); j++) {
                                out.println("<option  value='" + Lista.get(j).getCed() + "'>" + Lista.get(j).getCed() + "</option>");
                            }
                        %>
                    </select>                           

                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <th>Nombre:</th>
                            <th>Primer Apellido</th>
                            <th>Segundo Apellido:</th>
                            <th>Telefono:</th>
                            <th>Vencimiento de Licencia:</th>
                            <th>Vencimiento de la licencia del estado del chofer:</th>
                            <th>Foto del chofer:</th>
                            <th>Foto de la licencia chofer:</th>
                            <th>Foto de la licencia del estado del chofer:</th>
                        </tr>
                        <tr>
                            <td id="nombree"> <%   out.println(Lista.get(0).getNom());%></td>
                            <td id="primerApellidoo"> <%   out.println(Lista.get(0).getAp1());%> </td>
                            <td id="segundoApellidoo"> <%   out.println(Lista.get(0).getAp2());%></td>
                            <td id="telefonoo"> <%   out.println(Lista.get(0).getNumtel());%> </td>
                            <td id="datevenc"> <%   out.println(Lista.get(0).getVencimientoLicencia());%> </td>
                            <td id="permicond"> <%   out.println(Lista.get(0).getVencimientoEstadoLicencia());%></td>
                            <td> <img  id="FotografiaCond" width="100"  src='../imagen/<%   out.println(Lista.get(0).getRutaFoto());%>'></td>
                            <td >   <img id="licenCond" width='100'  src='../imagen/<%   out.println(Lista.get(0).getRutaLicencia());%>'></td>
                            <td > <img id="permcondfile" width="100"  src='../imagen/<%   out.println(Lista.get(0).getRutaEstadoLicencia());%>'> </td>
                    </table>  
                </div>
            </div>
        </div>

        <script src="../js/bootstrap.min.js" type="text/javascript"></script>  
    </body>
</body>
</html>
