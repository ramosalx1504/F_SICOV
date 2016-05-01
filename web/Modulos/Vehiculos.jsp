<%@page import="java.util.ArrayList"%>
<%@page import="Conexion.Consulta"%>
<%@page import="Beans.Vehiculo"%>
<%@page import="Beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
    HttpSession actual = request.getSession();
    Usuario us = (Usuario) request.getSession().getAttribute("usuario");
    if(actual.getAttribute("usuario") == null)
    {
    response.sendRedirect("../index.jsp");
    return;
    }
    if(!us.isMod_Vehiculos())
    {
    response.sendRedirect("Main.jsp");
    return;
    }
    Date dNow = new Date();
    SimpleDateFormat ft = 
    new SimpleDateFormat ("yyyy-MM-dd");
    String fechaHoy = ft.format(dNow);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Consulta c = new Consulta();
    ArrayList<Vehiculo> Lista = c.ListarPlacas();
%>
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
        <script> jQuery(document).ready(function(){jQuery("#form").validationEngine();}); </script>
        <script> jQuery(document).ready(function(){jQuery("#expVehiculo").validationEngine();}); </script>
        <script>
            jQuery(function($){
            //$("#date").mask("9999-99-99",{placeholder:"dd/mm/yyyy"});
            //$("#date2").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
            $("#telefono").mask("9999-9999? ext 9999");
            $("#cedula").mask("9-9999-9999");
            $("#cc").mask("99?99");
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
                            <a href="/F_SICOV/Main.jsp" class="navbar-brand">SICOV</a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-1">
                            <ul class="nav navbar-nav">
                                <% if(us.isMod_Solicitudes_user() && !us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitud.jsp">Solicitar Servicio</a></li><%}%>
                                <% if(us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class=""><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
                                <% if(us.isMod_Vehiculos()){%><li class="active"><a href="/F_SICOV/Modulos/Vehiculos.jsp">Vehículos</a></li><%}%>
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
                            <li>Vehículos</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="cajon-principal">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/car.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Ingresar Vehículo.
                    </p>
                    <p class="text-center">
                        Módulo encargado de ingresar un nuevo vehículo.
                    </p>
                    <p>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#expVehiculos">Ver</a>
                    </p>
                </div>
                
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/tools.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Accesorios de Vehículo
                    </p>
                     <p class="text-center">
                        Módulo encargado del manejo de accesosrios de los vehículo.
                    </p>
                    <p>
                        <%-- <a href="#ventana2" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Entrar</a> --%>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#modalAccesorios">Ver</a>
                    </p>
                </div>
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/booklet.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Expediente de Vehículo.
                    </p>
                     <p class="text-center">
                        Módulo encargado de poder visualizar toda la información de un vehículo.
                    </p>
                    <p>
                        <a href="../ExpedienteVehiculo?trace=0" class="btn btn-default center-block btn-lg btn-primary" role="button" >Ver »</a>

                    </p>
                </div>
                <hr class="divisor">
            <div class="row">
                 <div class="col-sm-6 col-md-4">
                    
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/trends.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Baja del Vehículo.
                    </p>
                     <p class="text-center">
                        Módulo encargado del manejo activo o inactivo del vehículo.
                    </p>
                    <p>
                    <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#modalBajas">Ver</a>
                    </p>
                </div>
                
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/mantenimiento.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Mantenimiento Vehículo.
                    </p>
                     <p class="text-center">
                        Módulo encargado del mantenimiento del vehículo.
                    </p>
                    <p>
                        <a href="#" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
                 <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/buscar.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Buscar Vehículo.
                    </p>
                     <p class="text-center">
                        Módulo encargado de la búsqueda del expediente del vehículo.
                    </p>
                    <p>
                        <a href="#" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
               
            </div>
               
                
            </div>
           
            <hr class="divisor">
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='../Main.jsp'">Volver</button>
            </div>
            </div>
             <div class="modal fade" id="expVehiculos" role="dialog" data-backdrop="false">
            <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
    <div class="modal-content">
        <form id="expVehiculo" name="expVehiculo" action="../GuardarVehiculo" method="POST">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="col-sm-2">
              <img src="../Media/logito.png" class="img-responsive" width="120" height="120">
          </div>
                <h2 class="modal-title ">Ingresar nuevo vehículo</h2>
        </div>
        
                                <div class="modal-body">
                                    <div class="row">
                                          <div class="col-sm-12">
                                                <div class="row">
							<div class="col-sm-6 form-group">
								<label>Usuario:</label>
								<input name="usuarioEV" type="text" value="<%out.println(us.getUsername());%>" class="form-control" readonly>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Fecha:</label>
								<input name="fechaHoyEV" type="text" value="<%=fechaHoy%>" class="form-control" readonly>
							</div>	
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Placa:</label>
								<input name="placaEV" type="text" placeholder="Digite el número de placa" class="form-control" required>
							</div>	
							<div class="col-sm-4 form-group">
								<label>Chasis:</label>
                                                                <input name="chasisEV" type="text" placeholder="Digite el número de Chasis" class="form-control" maxlength="30" required>
							</div>	
							<div class="col-sm-4 form-group">
								<label>Motor:</label>
                                                                <input name="motorEV" type="text" placeholder="Digite el número de Motor" class="validate[required] form-control" maxlength="30" required>
							</div>		
						</div>	
                                                <div class="row">
							<div class="col-sm-6 form-group">
								<label>Año del Vehiculo:</label>
								<!--<input name="yearEV" type="text" class="form-control">-->
                                                                <input id="alta1" class="validate[required] form-control" type="text"  name="yearEV" required>
                                                                <script>$('#alta1').datetimepicker({viewMode: "years",format: "YYYY"});</script>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Fecha de Inscripción:</label>
								<!--<input name="fechaInscripcionEV" type="date" class="form-control">-->
                                                                <input id="alta" class="validate[required] form-control" type="text"  name="fechaInscripcionEV" required>
                                                                <script>$('#alta').datetimepicker({format: "YYYY-MM-DD"});</script>
							</div>	
									
						</div>	
                                                <div class="row">
							<div class="col-sm-3 form-group">
								<label>Tomo:</label>
                                                                <input name="tomoEV" type="text" placeholder="Digite el tomo" class="form-control" maxlength="4" required>
							</div>	
							<div class="col-sm-3 form-group">
								<label>Folio:</label>
								<input name="folletoEV" type="text" placeholder="Digite el folio" class="form-control" maxlength="4" required>
							</div>	
							<div class="col-sm-3 form-group">
								<label>Asiento:</label>
								<input name="asientoEV" type="text" placeholder="Digite el asiento" class="form-control" maxlength="4" required>
							</div>	
                                                        <div class="col-sm-3 form-group">
								<label>Valor Fiscal:</label>
								<input name="valorFiscalEV" type="text" placeholder="Digite el valor fiscal" class="form-control" maxlength="4" required>
							</div>
						</div>
                                                <!--
                                                <div class="row">
							<div class="col-sm-6 form-group">
						<label>Código del Departamento: </label>
                                                <select name="codigosDepartamentoEV" class="form-control">
                                                            <option>Informatica (1)</option>
                                                            <option>Recursos Humanos (2)</option>
                                                            <option>Bienes y Servicios (3)</option>
                                                            <option>Coordinacion (4)</option>
                                                </select>
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                <label>Código de Propietario:</label>
                                                <select name="codPropietarioEV" class="form-control">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                </select>
                                                </div>
                                                </div>
                                                <div class="form-group">
						<label>Cédula del Conductor:</label>
						<input name="cedConductorEV" type="text" placeholder="Digite la cédula del conductor" class="form-control">
                                                </div>
                                                -->
                                                <div class="form-group">
                                                <label>Foto del Vehículo:</label>
                                                <input name="fotoVehiculoEV" type="file"  class="form-control">
                                                </div>
                                                <div class="row">
						<div class="col-sm-3 form-group">
                                                            <label>Marca:</label>
                                                            <select name="marcaEV" class="form-control">
                                                            <option>Nissan</option>
                                                            <option>Mitsubishi</option>
                                                            <option>Toyota</option>
                                                            <option>Kia</option>
                                                            </select>
						</div>	
						<div class="col-sm-3 form-group">
                                                            <label>Modelo:</label>
                                                            <select name="modeloEV" class="form-control">
                                                            <option>Sentra</option>
                                                            <option>Corolla</option>
                                                            <option>Montero</option>
                                                            <option>Jimmy</option>
                                                            </select>
						</div>	
						<div class="col-sm-3 form-group">
                                                            <label>Color:</label>
                                                            <select name="colorEV" class="form-control">
                                                            <option>Blanco</option>
                                                            <option>Negro</option>
                                                            <option>Azul</option>
                                                            <option>Celeste</option>
                                                            <option>Plateado</option>
                                                            <option>Gris</option>
                                                            </select>
						</div>	
                                                <div class="col-sm-3 form-group">
                                                            <label>Combustible:</label>
                                                            <select name="combustibleEV" class="form-control">
                                                            <option>Regular</option>
                                                            <option>Super</option>
                                                            <option>Diesel</option>
                                                            <option>Gas</option>
                                                            </select>
						</div>
						</div>
                                                <div class="row">
						<div class="col-sm-3 form-group">
                                                            <label>Estilo:</label>
                                                            <select name="estiloEV" class="form-control">
                                                            <option>4x2</option>
                                                            <option>4x4</option>
                                                            <option>Sedan</option>
                                                            <option>Pickup</option>
                                                            </select>
						</div>
                                                <div class="col-sm-3 form-group">
                                                            <label>Cilindrada:</label>
                                                            <input id="cc" name="cilindradaEV" type="text" placeholder="Digite la cilindrada" class="form-control" required>
						</div>
                                                <div class="col-sm-3 form-group">
                                                            <label>Cantidad de Pasajeros:</label>
                                                            <select name="cantidadPasajerosEV" class="form-control">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                            <option>6</option>
                                                            </select>
						</div>
						</div> 
                                                <div class="row">
						<div class="col-sm-6 form-group">
                                                <label>Fecha del próximo RTV:</label>
						<!--<input name="proxRtvEV" type="date" class="form-control">-->
                                                <input id="alta2" class="validate[required,future[NOW]] form-control" type="text"  name="proxRtvEV" required>
                                                <script>$('#alta2').datetimepicker({format: "YYYY-MM-DD"});</script>
                                                </div>
                                                <div class="col-sm-6 form-group">   
                                                <label>Estado del RTV:</label>
                                                            <select name="estadoRtvEV" class="form-control">
                                                            <option>Al Día</option>
                                                            <option>Vencido</option>
                                                            </select>
                                                </div>
                                                </div>
                                                <!--
                                                <div class="form-group">
                                                <label>Emisión de Ordenes de Compra:</label>
						<input name="oCEV" type="text" placeholder="Digite la emisión de la orden de compra" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                <label>Documento Único Administrativo:</label>
						<input name="duaEV" type="text" placeholder="Digite el número del documento unico administrativo"  class="form-control">
                                                </div>
                                                <div class="row">
						<div class="col-sm-6 form-group">
                                                <label>Exoneración de Compra:</label>
						<input name="exoCompraEV" type="text" placeholder="Digite el monto de la exoneración" class="form-control">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                <label>Exoneración de Inscripción:</label>
						<input name="exoInscripcionEV" type="text" placeholder="Digite el monto de la exoneración" class="form-control">
                                                </div>
                                                </div>
                                                -->
                                                
                                           </div>
                                    </div>
                                </div>
            
                                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        <button  type="submit" class="btn btn-success">Guardar</button>
                                                </div>
            </form>
    </div>
    </div>
  </div> 
                        
                        <div class="modal fade" id="modalAccesorios" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
    <div class="modal-content">
        <form name="" action="../GuardarAccesorio" method="POST">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="col-sm-2">
              <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
          </div>
                <h2 class="modal-title">Accesorios del Vehículo</h2>
        </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            
                                                <div class="row">	
						<div class="form-group col-sm-3">
							<label>Buscar Vehículo: </label>
							<input type="text" placeholder="Digite la placa del vehículo" class="form-control">
						</div>
                                                 <div class="col-sm-3 form-group">
								<label>Número de Placa: </label>
                                                                <select class="form-control" id='placa' name="placaAC">
                                                                 <%
                                                                    for(int j = 0; j  < Lista.size(); j++){out.println("<option  value='"+ Lista.get(j).getPlaca() +"'>"+ Lista.get(j).getPlaca() +"</option>");}%>
                                                                </select>
								
                                                </div> 
                                                <div class="col-sm-3 form-group">
								<label>Fecha: </label>
                                                                <input name="fechaAC" value="<%=fechaHoy%>" type="date" class="form-control" readonly>
                                                </div>
                                                <div class="col-sm-3 form-group">
								<label>Usuario: </label>
                                                                <input name="usuarioAC" type="text" value="<%out.println(us.getUsername());%>" class="form-control" readonly>
                                                </div>
                                                </div>
						<div class="row">
                                                        <!--<div class="col-sm-6 form-group">
								<label>Código del Accesorio: </label>
                                                                <input name="codigoAccesorio" type="text" placeholder="Código del accesorio" class="form-control">
                                                        </div>-->
                                                        <div class="col-sm-6 form-group">
                                                                <label>Nombre del Accesorio:</label>
                                                                <input name="nombreAC" type="text" placeholder="Digite el nombre del accesorio" class="form-control">
                                                        </div>
                                                </div>
                                                <div class="row">
                                                        <div class="col-sm-6 form-group">
								<label>Fotografía del Accesorio: </label>
                                                                <input name="imagenAC" type="file" class="form-control">
                                                        </div>
                                                </div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Descripción: </label>
							<textarea name="descripcionAC" placeholder="Utilice este espacio para describir el artículo, también puede realizar alguna observación sobre el artículo." rows="3" class="form-control"></textarea>
						</div>	
                                                </div>
                                                                      
                                        </div>
                                    </div>
                                </div>
                                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-success">Guardar</button>
                                                </div>
            </form>
    </div>
    </div>
  </div>
      <div class="modal fade" id="modalBajas" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
    <div class="modal-content">
        <form name="" action="#" method="POST">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="col-sm-2">
              <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
          </div>
                <h2 class="modal-title">Baja del Vehículo</h2>
        </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            
                                                <div class="row">	
						<div class="form-group col-sm-3">
							<label>Buscar Vehículo: </label>
							<input type="text" placeholder="Digite la placa del vehículo" class="form-control">
						</div>
                                                 <div class="col-sm-3 form-group">
								<label>Número de Placa: </label>
								<input name="placa" type="text" placeholder="Número de Placa" class="form-control">
                                                </div> 
                                                <div class="col-sm-3 form-group">
								<label>Fecha de Recibido: </label>
                                                                <input name="fechaRecibido" type="date" class="form-control">
                                                </div>
                                                <div class="col-sm-3 form-group">
								<label>Usuario: </label>
                                                                <input name="usuario" type="text" value="<%out.println(us.getUsername());%>" class="form-control">
                                                </div>
                                                </div>
						<div class="row">
                                                        <div class="col-sm-4 form-group">
								<label>Estado del Vehiculo: </label>
								<select name="estadoBaja" class="form-control">
                                                                <option>Alta</option>
                                                                <option>Baja</option>
                                                                </select>
                                                        </div>
							
                                                        <div class="col-sm-4 form-group">
								<label>Fecha de la baja: </label>
                                                                <input name="fechaBaja" type="date" class="form-control">
                                                        </div>
                                                </div>
                                                <div class="row">
                                                        <div class="form-group col-sm-12">
							<label>Tipo de Baja:</label>
							<textarea name="motivoBaja" placeholder="Digite el motivo por el cual el vehículo se da de baja" rows="3" class="form-control"></textarea>
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-12">
                                                       <label>Documento de la Baja: </label>
                                                       <input name="docBaja" type="file"  class="form-control">
						</div>
                                                </div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Observaciones: </label>
							<textarea name="observacionesAC" placeholder="Digite aca las Observaciones a Considerar" rows="3" class="form-control"></textarea>
						</div>	
                                                </div>
                                                                      
                                        </div>
                                    </div>
                                </div>
                                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        <button type="button" class="btn btn-success" data-dismiss="modal">Guardar</button>
                                                </div>
            </form>
    </div>
    </div>
  </div>
    </div><!-- fin container-->
    </form>
        <footer class="footer"><div class="container"><div class="footer-control"><p class="footer-text">Sistema de Gestión Vehicular ,<a href="http://www.dgac.go.cr/">Dirección General de Aviación Civil</a> 2016.</p></div></div></footer>   
        <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script> 
    </body>
</html>
