<%@page import="Beans.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Conductor"%>
<%@page import="Conexion.Consulta"%>
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
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Consulta c = new Consulta();
    ArrayList<Conductor> Lista = c.Listaconductores();
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
        <script> jQuery(document).ready(function(){jQuery("#form1").validationEngine();}); </script>
           
        <script>
            jQuery(function($){
            //$("#date").mask("9999-99-99",{placeholder:"dd/mm/yyyy"});
            //$("#date2").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
            $("#telefono").mask("9999-9999? ext 9999");
            $("#cedula").mask("9-9999-9999");
            });
        </script>
        <script>
                function comprueba_extension(formulario, archivo, id) { 
                extensiones_permitidas = new Array(".gif",".jpg",".png"); 
                mierror = ""; 
                if (!archivo) { 
                //Si no tengo archivo, es que no se ha seleccionado un archivo en el formulario 
                mierror = "No has seleccionado ningún archivo"; 
                }else{ 
                //recupero la extensión de este nombre de archivo 
                extension = (archivo.substring(archivo.lastIndexOf("."))).toLowerCase(); 
                //alert (extension); 
                //compruebo si la extensión está entre las permitidas 
                permitida = false; 
                for (var i = 0; i < extensiones_permitidas.length; i++) { 
                if (extensiones_permitidas[i] == extension) { 
                permitida = true; 
                break; 
                } 
                } 
                 if (!permitida) { 
                 mierror = "Comprueba la extensión de los archivos a subir. \nSólo se pueden subir archivos con extensiones: " + extensiones_permitidas.join(); 
                }else{ 
         	//submito! 
                //alert ("Todo correcto. Voy a submitir el formulario."); 
                //formulario.submit(); 
                return 1; 
                        } 
                } 
                //si estoy aqui es que no se ha podido submitir
                alert (mierror); 
                if(id == "imagen"){document.getElementById("imagen").value="";}
                if(id == "imagen1"){document.getElementById("imagen1").value="";}
                if(id == "imagen2"){document.getElementById("imagen2").value="";}
        return 0; 
                }
            </script>
    </head>
    <body>
        <% 
        out.print(c.GenerarScripttCompleto(c.Listaconductores()));
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
                                <% if(us.isMod_Solicitudes_adm()){%><li class=""><a href="/F_SICOV/Modulos/Solicitudes.jsp">Solicitudes</a></li><%}%>
                                <% if(us.isMod_Conductores()){%><li class="active"><a href="/F_SICOV/Modulos/Conductores.jsp">Conductores</a></li><%}%>
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
                            <li><a href="/F_SICOV/Main.jsp">Inicio</a></li>
                            <li>Conductores</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
                <div class="cajon-principal">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/chapu.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Ingresar Conductor.
                    </p>
                    <p class="text-center">
                        Módulo encargado de ingresar el expediente de un nuevo conductor.
                    </p>
                    <p>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#myModal">Ver</a>
                    </p>
                </div>
                <!--<div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/browser.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Permiso del Conductor.
                    </p>
                     <p class="text-center">
                        Módulo encargado de controlar los permisos del conductor.
                    </p>
                    <p>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#permisos">Ver</a>
                    </p>
                </div>-->
                <!-- <div class="col-sm-6 col-md-4">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/creditcard.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Licencias del Conductor.
                    </p>
                     <p class="text-center">
                        Módulo encargado de controlar el estado de las licencias del conductor.
                    </p>
                    <p>
                        <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#licencias">Ver</a>
                    </p>
                </div>-->
                <div class="col-sm-6 col-md-6">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/clipboard.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Historial del Conductor.
                    </p>
                     <p class="text-center">
                        Módulo encargado de llevar el historial del conductor.
                    </p>
                    <p>
                        <a href="../Modulos/Conductores_Lista.jsp" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div>
                 </div>
                   <hr class="divisor">
            <div class="row">
                
                 <div class="col-sm-6 col-md-6">
                    
                     <img class="img-circle img-responsive marginauto" width="70" src="../Media/mantenimiento.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Mantenimiento Conductor.
                    </p>
                     <p class="text-center">
                        Módulo encargado del mantenimiento del expediente del conductor.
                    </p>
                    <p>
            <a  class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal" data-target="#myModal1">Ver</a>
                    </p>
                </div>
                
                <div class="col-sm-6 col-md-6">
                    <img class="img-circle img-responsive marginauto" width="70" src="../Media/buscar.png" alt=""/>
                    <br>
                    <p class="text-center lead">
                        Buscar Conductor.
                    </p>
                     <p class="text-center">
                        Módulo encargado de la busqueda de conductores en el sistema.
                    </p>
                    <p>
                        <a href="../Modulos/BuscarCoonductor.jsp" class="btn btn-default center-block btn-lg btn-primary" role="button" data-toggle="modal">Ver »</a>
                    </p>
                </div> 
            </div>
           
            <hr class="divisor">
            <div class="col-sm-12">
                <button class="btn btn-default center-block" onclick="location.href='../Main.jsp'">Volver</button>
            </div>
            </div><!--Fin principal-->
        </div><!--fincontainer-->
        <div class="modal fade" id="myModal" role="dialog" data-backdrop="false">
<div class="modal-dialog modal-lg">
<div class="modal-content">
    <form id="form" action="../ServletIngresaConductor"  method="POST" role="form" enctype="multipart/form-data">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="col-sm-2">
                    <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
                </div>
                <h2 class="modal-title ">Ingresar Expediente del Conductor</h2>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                         <div class="row">
                                            <div class="form-group col-sm-6">
                                            <label>Número de Cédula:</label> 
                                            <input class="validate[required,maxSize[11],minSize[11]] form-control" type="text" id="cedula" name="cedula" 
                                                        required  placeholder="_-____-____">   
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Nombre del Conductor:</label>
                                                <input  class="validate[required,maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="nombre" name="nombre" required 
                                                             placeholder="Digite su nombre aqui">
                                            </div>
                                        </div>  
                                        
                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label>Primer Apellido:</label>
                                                <input class="validate[required,maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="primerApellido" 
                                                       name="primerApellido" required>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Segundo Apellido:</label>
                                                <input class="validate[maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="segundoApellido" 
                                                name="segundoApellido">
                                            </div>
                                        </div>     
                    
                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label>Número Teléfono:</label>
                                                <input class="validate[required,maxSize[20],minSize[6],phone] form-control" 
                                                       type="text" id="telefono" name="telefono" required 
                                                       placeholder="____-____">
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="form-group col-sm-6">
                                        <label>Fotografia del Conductor:</label>
                                        <input id="imagen" class="validate[required] form-control" type="file" name="imagen" onchange="comprueba_extension(this.form, this.form.imagen.value,'imagen')" required  />
                                        </div>
                                        
                                        <div class="form-group col-sm-6">
                                        <label for="" class="">Fotografía de la Licencia:</label>
                                        <input id="imagen1" class="validate[required] form-control" type="file" name="imagen1" onchange="comprueba_extension(this.form, this.form.imagen1.value,'imagen1')" required />
                                        </div>
                                        </div>
                                        <div class="row">
                                        <div class="form-group col-sm-4">
                                           <label>Vencimiento de la Licencia:</label>
                                           <input id="alta" class="validate[required,future[NOW]] form-control" type="text"  name="alta" required>
                                           <script>$('#alta').datetimepicker({format: "YYYY-MM-DD"});</script>
                                        </div>
                                        <div class="form-group col-sm-4">
                                        <label>Vencimiento del Permiso:</label>
                                        <input id="alta2" class="validate[required,future[NOW]] form-control" type="text" name="alta2" required />
                                        <script>$('#alta2').datetimepicker({format: "YYYY-MM-DD"});</script>
                                        </div>
                                        <div class="form-group col-sm-4">
                                        <label>Fotografía del permiso:</label>
                                        <input id="imagen2" class="validate[required] form-control" type="file" onchange="comprueba_extension(this.form, this.form.imagen2.value,'imagen2')" name="imagen2" required />
                                        </div>
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                                            <button type="submit" class="btn btn-success" >Guardar</button>
                                        </div>   
    
                        </div>
                    </div>
                </div>
        </form>
</div> 
</div>
</div>




            <div class="modal fade" id="myModal1" role="dialog" data-backdrop="false">
<div class="modal-dialog modal-lg">
<div class="modal-content">
    <form id="form" action="../ServletMantenimientoConductor"  method="POST" role="form" enctype="multipart/form-data">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="col-sm-2">
                    <img src="../Media/logito.png" class="img-responsive" alt="Cinque Terre" width="120" height="120">
                </div>
                <h2 class="modal-title ">Ingresar Expediente del Conductor</h2>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="form-group col-sm-4">
                                 <label> Ced&#250la:</label> 
                                        <select id='conductor' onchange="num()" name="cedula">
                                            <%
                                                for(int j = 0; j  < Lista.size(); j++){
                                                    out.println("<option  value='"+ Lista.get(j).getCed() +"'>"+ Lista.get(j).getCed() +"</option>");
                                                }
                                                %>
                                        </select>                
				</div>
                            </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                <label>Nombre:</label>
                                                <input  class="validate[required,maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="nombree" name="nombre" required 
                                                value="<%out.print(Lista.get(0).getNom()); %>"       placeholder="Digite su nombre aqui" >    
						</div>
                                                <div class="form-group col-sm-4">
                                                <label>Primer Apellido:</label>
                                                <input class="validate[required,maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="primerApellidoo" 
                                                name="primerApellido"  id="primerApellidoo" required  
                                                value="<%out.print(Lista.get(0).getAp1()); %>"
                                                placeholder="Digite su segundo apellido aqui">    
						</div>
                                                <div class="form-group col-sm-4">
                                                <label>Segundo Apellido:</label>
                                                <input class="validate[maxSize[40],custom[onlyLetterSp]] form-control" type="text" id="segundoApellidoo" 
                                                name="segundoApellido"  value="<%out.print(Lista.get(0).getAp2()); %>"
                                                placeholder="Digite su segundo apellido aqui">   
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                <label>Número teléfono:</label>
                                                <input class="validate[required,maxSize[20],minSize[6],phone] form-control" 
                                                type="text" id="telefonoo" name="telefono" required value="<%out.print(Lista.get(0).getNumtel()  ); %>"
                                                placeholder="Ej:####-####">    
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                <label>Seleccionar Fotografia del Conductor:</label>
                                                <input id="FotografiaCond" class="validate[required] form-control" type="file" name="imagen" required />    
						</div>
                                                <div class="form-group col-sm-4">
                                                <label>Seleccionar licencia de conducir del Conductor:</label>
                                                <input class="validate[required] form-control" type="file" name="imagen1" required />   
						</div>
                                                <div class="form-group col-sm-4">
                                                <label>Vencimiento de la licencia de conducir del Conductor:</label>
                                                <input id="permicond" class="validate[required,future[NOW]] form-control" type="date"  name="alta" 
                                               value="<%out.print(Lista.get(0).getVencimientoLicencia()); %>" required>   
						</div>
                                                </div>
                                                <div class="row">
                                                <div class="form-group col-sm-4">
                                                    <label>Seleccionar permiso de conducir por parte del estado:</label>
                                                <input  class="validate[required] form-control" type="file" name="imagen2" required />   
						</div>
                                                <div class="form-group col-sm-4">
                                                <label>Vencimiento del permiso de conducir por parte del estado:</label>
                                                <input id="datevenc" class="validate[required,future[NOW]] form-control" type="date" name="alta2" 
                                               value="<%out.print(Lista.get(0).getVencimientoEstadoLicencia()); %>"
                                               required> 
						</div>
                                                </div>
                                               
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                        <button type="submit" class="btn btn-success" >Guardar</button>
                                    </div>
    
                    </div>
                    </div>
                </div>
        </form>
</div> 
</div>
</div>
        
        
         <script src="../js/bootstrap.min.js" type="text/javascript"></script> 
    </body>
</html>