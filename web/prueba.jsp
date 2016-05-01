<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/moment.min.js" type="text/javascript"></script>
        <script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="js/bootstrap-datetimepicker.es.js" type="text/javascript"></script>
          <script>
                function comprueba_extension(formulario, archivo) { 
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
                document.getElementById("gg").value="";
                                
        return 0; 
                }
            </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        
  <div class="container">
  <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form method=post action="#" enctype="multipart/form-data"> 
              <input id="gg" type=file name="archivoupload" onchange="comprueba_extension(this.form, this.form.archivoupload.value)"> 
<input type=button name="Submit" value="Enviar" onclick="comprueba_extension(this.form, this.form.archivoupload.value)"> 
</form> 
          
          </form>
        </div>
      </div>
  </div>
</div>
       
        <script type="text/javascript">
     $('#divMiCalendario').datetimepicker({
                format:'DD/MM/YY'
                view
      });
     
   </script>
    </body>
</html>
