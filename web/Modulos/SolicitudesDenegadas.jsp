
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
                <%for(int i=0;i<listaDeneg.size(); i++){%>
                
                <tr>
            
                    <td><%out.println(listaDeneg.get(i).getUser1());%></td>
                    <td><%out.println(listaDeneg.get(i).getFechaSalida());%></td>
                    <td><%out.println(listaDeneg.get(i).getDepartamento());%></td>
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
      
    <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
          
                <h2 class="modal-title ">  SOLICITUD DE SERVICIO DE TRANSPORTE</h2>
        </div>
        <form name="kevincito" action="../GuardarSolicitud" method="POST">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                         
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Nombre del Usuario: </label>
                                                                
                                                              
                                                                      
                                                          
                                                        </div>	
                                                    <!--
							<div class="col-sm-4 form-group">
								<label>Fecha de Emisión: </label>
                                                                <input name="fechaEmision" type="text" placeholder="2016-12-17" class="form-control">
                                                        </div>
                                                    -->
                                                        <div class="col-sm-4 form-group">
								<label>Estado del Servicio</label>
                                                                <input type="estadoSolicitud" placeholder="En Espera" class="form-control" readonly>
                                                        </div>
							</div>
                                                       
						
                                                <div class="row">
							<div class="col-sm-4 form-group">
								<label>Fecha de Salida: </label>
								<input name="fechaS" id="input-date" type="date" class="form-control validate[required,minSize[6],maxSize[25]]" >
                                                        </div>	
							<div class="col-sm-4 form-group">
								<label>Fecha de Regreso: </label>
								<input name="fechaR" id="input-date" type="date" class="form-control">
                                                        </div>	
                                                         <div class="col-sm-4 form-group">
                                                                <label>Duración Estimada: </label>
                                                                <input name="duracionEstimada" type="text" placeholder="Duracion Estimada del Servicio" class="form-control">
                                                        </div>
                                                </div>
                                                <div class="row">
							<div class="col-sm-4 form-group">
								<label>Hora de Salida: </label>
								<input name="horaS" id="input-time" type="time" class="form-control">
                                                        </div>	
							<div class="col-sm-4 form-group">
								<label>Hora de Regreso: </label>
								<input name="horaR" id="input-time" type="time" class="form-control">
                                                        </div>	
                                                       
                                                </div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Destino: </label>
							<textarea name="destino" placeholder="Digite exactamente el destino a donde se dirige" rows="3" class="form-control"></textarea>
						</div>	
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                       <label>Provincia: </label>
							<select name="provincia" class="form-control">
                                                            <option>San José (1)</option>
                                                            <option>Alajuela (2)</option>
                                                            <option>Cartago (3)</option>
                                                            <option>Heredia (4)</option>
                                                            <option>Guanacaste (5)</option>
                                                            <option>Puntarenas (6)</option>
                                                            <option>Limón (7)</option>
                                                        </select>
						</div>
                                                <div class="form-group col-sm-4">
                                                       <label>Cantón: </label>
							<select name="canton" class="form-control">
                                                            <option>Acosta</option>
                                                            <option>Alajuelita</option>
                                                            <option>Aserrí</option>
                                                            <option>Curridabat</option>
                                                            <option>Desamparados</option>
                                                            <option>Dota</option>
                                                            <option>Escazú</option>
                                                            <option>Goicochea</option>
                                                            <option>León Cortéz Castro</option>
                                                            <option>Montes de Oca</option>
                                                            <option>Mora</option>
                                                            <option>Moravia</option>
                                                            <option>Pérez Zeledón</option>
                                                            <option>Puriscal</option>
                                                            <option>San José</option>
                                                            <option>Santa Ana</option>
                                                            <option>Tarrazú</option>
                                                            <option>Tibás</option>
                                                            <option>Turrubares</option>
                                                           <option>Vázquez de Coronado</option>
                                                        </select>
						</div>
                                                <div class="form-group col-sm-4">
                                                       <label>Distrito: </label>
							<select name="distrito" class="form-control">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                        </select>
						</div>
                                            </div>
                                               
                                               <div class="row">
                                                   
                                                          <div class="form-group col-sm-4">
                                                              <label>Departamento: </label>
							<select name="departamento" class="form-control">
                                                           
                                                            <option>Inform&aacute;tica</option>
                                                            <option>Recursos Humanos</option>
                                                            <option>Bienes y Servicios</option>
                                                            <option>Giras</option>
                                                           
                                                        </select>
                                                         </div>
							 <div class="form-group col-sm-4">
                                                              <label>Extensión: </label>
							<select name="extension" class="form-control">
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                        </select>
                                                         </div>
                                                       
						</div>
                                                <div class="row">
							<div class="col-sm-4 form-group">
								<label>Numero de Usuarios: </label>
							<select name="cantidad" class="form-control" onkeyup="crearCampos(this.value);" onclick="crearCampos(this.form.cantidad.value);" >
                                                            <option>1</option>
                                                            <option>2</option>
                                                            <option>3</option>
                                                            <option>4</option>
                                                            <option>5</option>
                                                            <option>6</option>
                                                            <option>7</option>
                                                            <option>8</option>
                                                        </select>
							</div>	
							<div class="col-sm-8 form-group" id="campos_dinamicos">
							
                                                                
							</div>	
						</div>
                                                <div class="row">	
						<div class="form-group col-sm-12">
							<label>Observaciones: </label>
							<textarea name="observaciones" placeholder="Digite aca las Observaciones a Considerar" rows="3" class="form-control"></textarea>
						</div>	
                                                </div>
                                                <!--
						<div class="row">
							<div class="col-sm-3 form-group">
								<label>Jefe de Departamento</label>
								<input type="text" placeholder="Kevin Corrales" class="form-control" readonly>
							</div>	
							<div class="col-sm-3 form-group">
								<label>Encargado de Revisión</label>
								<input type="text" placeholder="Lumbi Chinchilla" class="form-control" readonly>
							</div>		
						</div>
                                                <div class="row">
							<div class="col-sm-3 form-group">
								<label>Nombre del Conductor</label>
								<input type="text" placeholder="Alexis Ramos" class="form-control" readonly>
							</div>	
							<div class="col-sm-3 form-group">
								<label>Cédula del Conductor</label>
								<input type="text" placeholder="1-15570079" class="form-control" readonly>
							</div>
                                                        <div class="col-sm-3 form-group">
								<label>Número de Placa</label>
								<input type="text" placeholder="BCD506" class="form-control" readonly>
							</div>
                                                </div>
                                                <div class="row">	
                                                        <div class="form-group col-sm-12">
                                                                <label>Motivo de Denegación de Servicio</label>
                                                                <textarea placeholder="No se brindo el servicio porque no existian vehiculos disponibles" rows="3" class="form-control"></textarea>
                                                        </div>	
                                                </div>
                                                -->
                                                                 
                                        </div>
                                    </div>
                                </div>
         
                                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                        <button value="guardar" type="submit" class="btn btn-success" >Guardar</button>
                                                </div>
         </form>    
    </div>
    </div>
    </div>
        <%= request.getAttribute("resultado") == null ? "": request.getAttribute("resultado") %>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>