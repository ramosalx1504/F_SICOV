<%
    HttpSession actual = request.getSession();
    actual.removeAttribute("usuario");
    actual.invalidate();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <!-- CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- JS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine-es.js" type="text/javascript"></script>
        <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
        <script> jQuery(document).ready(function(){jQuery("#formLOGIN").validationEngine();}); </script>
        <script type="text/javascript">
            function checkCapsLock( e )
            {
                var fKeyCode=0;
                var myShiftKey=true;
                var msg=true; 
                if ( document.all )
                {
                    fKeyCode=e.keyCode;
                    myShiftKey=e.shiftKey;
                }
                else if ( document.layers )
                {
                    fKeyCode=e.which;
                    myShiftKey=( fKeyCode == 16 ) ? true : false;
                }
                else if ( document.getElementById )
                {
                    fKeyCode=e.which;
                    myShiftKey=( fKeyCode == 16 ) ? true : false;
                }
                if ( ( fKeyCode >= 65 && fKeyCode <= 90 ) && !myShiftKey )
                {
                    msg=false;
                    document.getElementById('caplock').style.display  = 'block';
                }
                if(msg)
                {
                    document.getElementById('caplock').style.display  = 'none';
                }
        }
        </script>
        <!-- js -->
        <% String alerta = (String) request.getAttribute("alerta"); %>
    </head>
    <body style="padding-top: 5%;" class="fondoindex" >
        <div class="container">
            
                    <%= request.getAttribute("alerta") == null ? "" : request.getAttribute("alerta") %>
           
            <div id="caplock" class="alert alert-warning col-sm-3 " style=" float: right !important; display: none;" >
                <span class="glyphicon glyphicon-warning-sign" style="font-size: 16px">    Bloq.Mayús Activo!</span>
            </div>
            <div class="center-block cajon-logueo" >
                <div>
                  <img class="img-responsive" src="Media/logo2.png" alt=""/>  
                </div>
                <hr>
                <form id="formLOGIN" action="Login?code=1" method="POST" role="form" autocomplete="off">
                    <div class="form-group">
                        <label class="col-md-12 center-block text-center">Usuario</label>
                        <input id="nombre" name="usuario"  class="form-control validate[required,maxSize[25],custom[onlyLetterSp]]" type="text" onKeyPress=" checkCapsLock(event)">
                    </div>
                    <div class="form-group">
                        <label class="col-md-12 control-label text-center">Contraseña</label>
                        <input id="pass" name="pass" class="form-control validate[required,minSize[6],maxSize[25]] " onKeyPress=" checkCapsLock(event)" type="password">
                    </div>  
                    <input value="Ingresar" class="btn btn-primary center-block" type="submit">
                </form>
                
            </div> 
        </div>
                
        <script src="js/bootstrap.min.js" type="text/javascript"></script>  
    </body>
</html>