<%@page import="Beans.Usuario"%>
<%
    HttpSession actual = request.getSession();
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("/F_SICOV/index.jsp");
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
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/mascaras-input.js" type="text/javascript"></script>
        <script src="../js/jquery.validationEngine-es.js" type="text/javascript"></script>
        <script src="../js/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="../js/moment-with-locales.js" type="text/javascript"></script>
        <script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <!-- Script -->
        <!-- Script <script> jQuery(document).ready(function(){jQuery("#kevincito").validationEngine();}); </script> -->
         <script> jQuery(document).ready(function(){jQuery("#controlCombustible").validationEngine();}); </script>
         <% Usuario us = (Usuario) request.getSession().getAttribute("usuario"); %>
         <script>
            jQuery(function($){
            //$("#date").mask("9999-99-99",{placeholder:"dd/mm/yyyy"});
            //$("#date2").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
            $("#numeroTarjeta").mask("9999-9999-9999-9999");
            });
        </script>
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
                            <a href="/SICOV/Main.jsp" class="navbar-brand">SICOV</a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-1">
                            <ul class="nav navbar-nav">
                                <% if(us.isMod_Solicitudes_user() && !us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitud.jsp">Solicitar Servicio</a></li><%}%>
                                <% if(us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class=""><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
                                <% if(us.isMod_Vehiculos()){%><li class=""><a href="/F_SICOV/Modulos/Vehiculos.jsp">Vehículos</a></li><%}%>
                                <% if(us.isMod_Combustible()){%><li class="active"><a href="/F_SICOV/Modulos/Combustible.jsp">Combustible</a></li><%}%>
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
        <div class="container">
            <div class="cajon-principal">
                <div class="row">
                    <div class="col-sm-12">
                        <ol class="breadcrumb">
                            <li> </li>
                            <li><a href="/F_SICOV/Main.jsp">Inicio</a></li>
                            <li>Combustible</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="cajon-principal">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/gas.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Facturas de Combustible.
                    </p>
                    <p class="text-center">
                        Módulo encargado de ingresar facturas de combustible.
                    </p>
                    <p>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#factGasolina">Ver</a>
                    </p>
                </div>
                <!--div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/mantenimiento.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Mantenimiento de Facturas.
                    </p>
                     <p class="text-center">
                        Módulo encargado del mantenimiento del modulo de facturas de combustible.
                    </p>
                    <p>
                        <a href="#" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div-->
                 <div class="col-sm-6 col-md-6">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/buscar.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Buscar Facturas.
                    </p>
                     <p class="text-center">
                        Módulo encargado de la búsqueda de facturas de combustible.
                    </p>
                    <p>
                        <a href="../Modulos/Combustible_Lista.jsp" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
               
                
            </div>
           
            <hr class="divisor">
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='../Main.jsp'">Volver</button>
            </div>
            </div>
            
            
    <div class="modal fade" id="factGasolina" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
    <div class="modal-content">
        <form name="controlCombustible" id="controlCombustible" action="../Factura_Combustible" method="POST">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="col-sm-2">
                <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
            </div>
                <h2 class="modal-title ">Ingresar Factura de Combustible</h2>
            </div>
                                <div class="modal-body">
                                    <!--div class="row">	
						<div class="form-group col-sm-12">
							<label>Buscar Vehículo: </label>
							<input type="text" placeholder="Digite la placa del vehículo a la cual quiere asociar la factura" class="form-control">
						</div>	
                                                </div-->
                                                <div class="row">
							<div class="form-group col-sm-12">
								<label>Usuario que ingresa la factura : </label>
                                                                <input name="usuario" type="text" placeholder="Nombre del usuario" value="<% out.println(us.getUsername()); %>"
                                                                       class="form-control" readonly>
                                                        </div>	
                                                        <!--div class="col-sm-4 form-group">
								<label>Fecha de Recibido: </label>
                                                                <input name="fechaRecibido" type="date" class="form-control">
                                                        </div-->
                                                        <div class="col-sm-4 form-group">
								<label>Placa del Vehículo: </label>
								<input name="placa" type="text" placeholder="BCX901" class="form-control"required>
                                                        </div>
                                                </div>
						<div class="row">
                                                        <div class="form-group col-sm-6">
								<label>Tipo de Pago: </label>
                                                                <select id="tipoPago" onchange="Habilitar()" name="tipoPago" class="form-control"required>
                                                                <option>Tarjeta</option>
                                                                <option>Efectivo</option>
                                                                </select>
                                                        </div>	
							<div class="form-group col-sm-6">
								<label>Número de Tarjeta: </label>
                                                                <input  id="numeroTarjeta" name="numeroTarjeta" type="text" placeholder="Digite el número de tarjeta" 
                                                                        class="validate[required,maxSize[25],minSize[11]] form-control"
                                                                        placeholder="____-____-____-____">
                                                        </div>
                                                        <!--div class="form-group col-sm-4">
                                                       <label>Estado con bancos: </label>
                                                       <select id="estadoBancos" name="estadoBancos" class="form-control">
                                                                <option>Activo</option>
                                                                <option>Inactivo</option>
                                                       </select>
                                                        </div-->
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                       <label>Fecha de la Factura: </label>
                                                       <input name="fechaIngreso" type="text" id="alta" class="validate[required,past[NOW]] form-control"required>                                                              
                                                       <script>$('#alta').datetimepicker({format: "YYYY-MM-DD"});</script>
                                                </div>
                                                <div class="form-group col-sm-4">
                                                       <label>Número de Factura: </label>
                                                       <input name="numeroFactura" type="text" placeholder="Número de la factura" class="form-control"required>
						</div>
                                                <div class="form-group col-sm-4">
                                                       <label>Monto de la Compra: </label>
                                                       <input name="montoFactura" type="text" placeholder="Monto de la factura" class="form-control"required>
						</div>
                                                
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-6">
                                                       <label>Cédula de Estación: </label>
                                                       <input name="numeroEstacion" type="text" placeholder="Digite la cédula de la estación" class="form-control"required>
						</div>
                                                <div class="form-group col-sm-6">
                                                       <label>Nombre de la Estación de Servicio: </label>
						<input name="nombreEstacion" type="text" placeholder="Digite el nombre de la estación" class="validate[maxSize[20],custom[onlyLetterSp]] form-control"required>
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-6">
                                                       <label>Kilometraje: </label>
							<input name="kilometraje" type="text" placeholder="Digite el kilometraje del vehiculo" class="validate[maxSize[20],custom[onlyNumberSp]] form-control"required>
						</div>
                                                <div class="form-group col-sm-6">
                                                       <label>Litros: </label>
							<input name="litros" type="text" placeholder="Cantidad de litros" class="validate[maxSize[20],custom[onlyNumberSp]] form-control"required>
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-12">
                                                       <label>Foto del Voucer: </label>
                                                       <input name="inFotoVoucher" type="file"  class="form-control">
						</div>
                                                </div>
                                                                   
                                        </div> 
                                        <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                    <button value="guardar" type="submit" class="btn btn-success" >Guardar</button>
                                    </form>
                                </div>
                                    </div><!--FIN MODAL CONTENIDO-->
                                </div>
                                
    
       
    </div>
    </div>
                
  </div>                                
                        
                                    
                 
                             
                                  
                                
                
             
                                
                                    
           
                               
      
                                
   
    </div><!-- fin container-->
        <footer class="footer"><div class="container"><div class="footer-control"><p class="footer-text">Sistema de Gestión Vehicular ,<a href="http://www.dgac.go.cr/">Dirección General de Aviación Civil</a> 2016.</p></div></div></footer>   

    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>