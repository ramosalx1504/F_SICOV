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
    if(!us.isMod_Solicitudes_adm())
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
        <script> jQuery(document).ready(function(){jQuery("#form1").validationEngine();}); </script>
           
        <script>
            jQuery(function($){
            //$("#date").mask("9999-99-99",{placeholder:"dd/mm/yyyy"});
            //$("#date2").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
            $("#telefono").mask("9999-9999? ext 9999");
            $("#cedula").mask("9-9999-9999");
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
                            <li><a href="">Inicio</a></li>
                            <li>Solicitudes</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="cajon-principal">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/solicitudes.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Buzón Solicitudes.
                    </p>
                    <p class="text-center">
                        Módulo encargado del manejo de solicitudes de transporte.
                    </p>
                    <p>
                        <a href="/F_SICOV/solicitudes?code=6" class="btn btn-default center-block btn-lg btn-primary" role="button">Ver</a>
                    </p>
                </div>
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/check.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Finalizar solicitud en curso.
                    </p>
                     <p class="text-center">
                        Módulo encargado del manejo de solicitudes de transporte.
                    </p>
                    <p>
                        <a href="/F_SICOV/solicitudes?code=2" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
                 <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/buscar.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Buscar Solicitud.
                    </p>
                     <p class="text-center">
                        Módulo encargado del manejo de solicitudes de transporte.
                    </p>
                    <p>
                        <a href="/F_SICOV/solicitudes?code=3" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
               
                
            </div>
            <hr class="divisor">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/schooolbus.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Solicitar Servicio de Transporte
                    </p>
                     <p class="text-center">
                        Módulo encargado del manejo de solicitudes de transporte.
                    </p>
                    <p>
                        <%-- <a href="#ventana2" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Entrar</a> --%>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#ingresarSolicitud">Ver</a>
                    </p>
                </div>
              
            </div>
            <hr class="divisor">
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='../Main.jsp'">Volver</button>
            </div>
            </div>
                        <div class="modal fade" id="ingresarSolicitud" role="dialog" data-backdrop="false">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      
    <div class="modal-content">
         <form name="nuevaSolicitud" id="form" action="../Buzon_Solicitudes" method="POST">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="col-sm-2">
              <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
          </div>
                <h2 class="modal-title ">  SOLICITUD DE SERVICIO DE TRANSPORTE</h2>
        </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            
                                                <div class="row">
							<div class="col-sm-6 form-group">
								<!--<label>Usuario:</label>-->
                                                                <input name="usuarioST" type="hidden" value="<%out.println(us.getUsername());%>" class="form-control" readonly>
                                                        </div>	
							<div class="col-sm-6 form-group">
								<!--<label>Fecha de Recibido: </label>-->
                                                                <input name="fechaRecibidoST" type="hidden" value="<%=fechaHoy%>"  class="form-control" readonly>
                                                        </div>	
                                                         
                                                </div>
                                                <div class="row">
							<div class="col-sm-6 form-group">
								<label>Encargado: </label>
								<input name="encargadoST" placeholder="Digite el nombre del encargado" type="text" class="validate[required,custom[onlyLetterSp],minSize[2],maxSize[30]] form-control">
                                                        </div>	
							<div class="col-sm-6 form-group">
								<label>Email del Encargado: </label>
								<input name="emailEncargadoST"  type="email" placeholder="Digite el email del encargado" class="validate[required,custom[email]] form-control">
                                                        </div>	
                                                         
                                                </div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Fecha de Salida: </label>
								<!--<input name="fechaSalidaST"  type="date" class="form-control">-->
                                                                <input id="alta2" class="validate[required,future[NOW]] form-control" type="text" name="fechaSalidaST" required />
                                                                <script>$('#alta2').datetimepicker({format: "YYYY-MM-DD"});</script>
                                                        </div>	
							<div class="col-sm-4 form-group">
								<label>Fecha de Regreso: </label>
								<!--<input name="fechaRegresoST" type="date" class="form-control">-->
                                                                <input id="alta3" class="validate[required,future[NOW]] form-control" type="text" name="fechaRegresoST" required />
                                                                <script>$('#alta3').datetimepicker({format: "YYYY-MM-DD"});</script>
                                                        </div>	
                                                         <div class="col-sm-4 form-group">
                                                                <label>Duración Estimada: </label>
                                                                <input name="duracionEstimadaST" type="text" placeholder="Digite un aproximado de duracion" class="validate[required,minSize[5],maxSize[15]] form-control">
                                                        </div>
                                                </div>
                                                <div class="row">
							<div class="col-sm-4 form-group">
								<label>Hora de Salida: </label>
								<!--<input name="horaSalidaST"  type="date" class="form-control">-->
                                                                <input id="alta4" class=" form-control" type="text" name="horaSalidaST" required />
                                                                <script>$('#alta4').datetimepicker({format: 'LT'});</script>
                                                        </div>	
							<div class="col-sm-4 form-group">
								<label>Hora de Regreso: </label>
								<!--<input name="horaRegresoST"  type="date" class="form-control">-->
                                                                <input id="alta5" class=" form-control" type="text" name="horaRegresoST" required />
                                                                <script>$('#alta5').datetimepicker({format: 'LT'});</script>
                                                        </div>	
                                                </div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Destino: </label>
							<textarea name="destinoST" placeholder="Digite exactamente el destino a donde se dirige" rows="3" class="validate[required,minSize[10],maxSize[60]] form-control"></textarea>
						</div>	
                                                </div>
                                                <div class="row">
                                                   
                                                          <div class="form-group col-sm-4">
                                                              <label>Departamento del Encargado: </label>
							<select name="departamentoST" class="form-control validate[required]">
                                                           
                                                            <option>Informática</option>
                                                            <option>Recursos Humanos</option>
                                                            <option>Bienes y Servicios</option>
                                                            <option>Giras</option>
                                                           
                                                        </select>
                                                         </div>
							<div class="form-group col-sm-4">
                                                        <label>Extensión del Encargado: </label>
							<input name="extensionST" id="telefono" type="text" placeholder="____-____" class="form-control validate[required,minSize[8],maxSize[18],custom[phone]]">
                                                        </div>
                                                       
						</div>
                                                <div class="row">
							<div class="col-sm-4 form-group">
							<label>Cantidad de Pasajeros: </label>
							<select name="numeroUsuariosST" class="validate[required] form-control">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                        </select>
							</div>	
							<div class="col-sm-8 form-group">
								<label>Nombre de los Acompañantes: </label>
								<input name="nombreUsuariosST" type="text" placeholder="Digite el nombre de los usuarios" class="validate[required,minSize[2],maxSize[30]] form-control">
							</div>	
						</div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Observaciones: </label>
							<textarea name="observacionesST" placeholder="Digite aca las Observaciones a Considerar" rows="3" class="validate[required,minSize[10],maxSize[50]] form-control"></textarea>
						</div>	
                                                </div>
                                                
                                                                     
                                        </div>
                                    </div>
                                </div>
                                                <div class="modal-footer">
                                                        <p class="text-left">SISTEMA DE GESTIÓN DGAC V. 01</p>
                                                        <p class="text-left">6F36,Solicitud de Servicio de Transporte</p>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        <button value="guardar" type="submit" class="btn btn-success" >Guardar</button>
                                                </div>
        </form> 
    </div>
    </div>
  </div>
           </div><!-- fin container-->
               <footer class="footer"><div class="container"><div class="footer-control"><p class="footer-text">Sistema de Gestión Vehicular ,<a href="http://www.dgac.go.cr/">Dirección General de Aviación Civil</a> 2016.</p></div></div></footer>   

    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>