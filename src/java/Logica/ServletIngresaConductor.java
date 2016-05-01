
package Logica;
import Conexion.Consulta;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "ServletIngresaConductor", urlPatterns = {"/ServletIngresaConductor"})
public class ServletIngresaConductor extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
        protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
           
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("");
        
        String x="";
        boolean xx=true;
        for (String retval : uploadPath.split("build", 2)) {
            if(xx==true){
                x=retval;
                xx=false;
            }
        }
        x+="web/imagen";

        // creates the directory if it does not exist
        File uploadDir = new File(x);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
            int contar=0;
            int contar1 = 0;
            String ced = "";
            String nom = "";
            String ap1 = "";
            String ap2 = "";
            String numtel = "";
            String rutaFoto = "";
            String rutaLicencia = "";
            String rutaEstadoLicencia = "";
            String vencimientoLicencia1 = "";
            String vencimientoEstadoLicencia1 = "";
            Date vencimientoLicencia;
            Date vencimientoEstadoLicencia;

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = x + File.separator + fileName;
                        File storeFile = new File(filePath);
                        
                        if(contar1 == 0){
                            rutaFoto = fileName;
                        }
                        if(contar1 == 1){
                            rutaLicencia = fileName;
                        }
                        if(contar1 == 2){
                            rutaEstadoLicencia = fileName;
                        }
                        
                        // saves the file on disk
                        item.write(storeFile);
                        System.err.println(fileName);
                        System.err.println(filePath);
                        System.err.println(getServletContext());
                        System.err.println(getServletContext().getRealPath(""));
                        contar1++;
                    }else{
                        if(contar==0){
                            ced=item.getString();
                        }
                        if(contar==1){
                            nom=item.getString();
                        }
                        if(contar==1){
                            nom=item.getString();
                        }
                        if(contar==2){
                            ap1=item.getString();
                        }
                        if(contar==3){
                            ap2=item.getString();
                        }
                        if(contar==4){
                            numtel=item.getString();
                        }
                        if(contar==5){
                            vencimientoLicencia1=item.getString();
                        }
                        if(contar==6){
                            vencimientoEstadoLicencia1=item.getString();
                        }
                        contar++;
                    }                    
                }
            }
        } catch (Exception ex) {
            
        }
        vencimientoLicencia = java.sql.Date.valueOf(vencimientoLicencia1);
        vencimientoEstadoLicencia = java.sql.Date.valueOf(vencimientoEstadoLicencia1);
        Consulta c = new Consulta();
    if(!c.existeChofer(ced)){
        c.ingresaChofer(ced, nom, ap1, ap2, numtel, rutaFoto, rutaLicencia, rutaEstadoLicencia, 
                vencimientoLicencia, vencimientoEstadoLicencia);
                response.sendRedirect("/SICOV/Modulos/Conductores.jsp");
    }
    else{
                  String resultado = "<p class'bg-warning'> Contraseña Incorrecta </p>";
                  request.setAttribute("resultado", resultado);
                  response.sendRedirect("/F_SICOV/Modulos/Conductores.jsp");
    }
        
    }
}














/*
String ced = request.getParameter("cedula");
    String nom = request.getParameter("nombre");
    String ap1 = request.getParameter("primerApellido");
    String ap2 = request.getParameter("segundoApellido");
    String numtel = request.getParameter("telefono");
    String rutaFoto = request.getParameter("imagen");
    String rutaLicencia = request.getParameter("imagen1");
    String rutaEstadoLicencia = request.getParameter("imagen2");
    String vencimientoLicencia1 = request.getParameter("alta");
    String vencimientoEstadoLicencia1 = request.getParameter("alta2");
    Date vencimientoLicencia = java.sql.Date.valueOf(vencimientoLicencia1);
    Date vencimientoEstadoLicencia = java.sql.Date.valueOf(vencimientoEstadoLicencia1);
    
    Consulta c = new Consulta();
    if(!c.existeChofer(ced)){
        c.ingresaChofer(ced, nom, ap1, ap2, numtel, rutaFoto, rutaLicencia, rutaEstadoLicencia, 
                vencimientoLicencia, vencimientoEstadoLicencia);
                response.sendRedirect("/SICOV/Modulos/Conductores.jsp");
    }
    else{
                  String resultado = "<p class'bg-warning'> Contraseña Incorrecta </p>";
                  request.setAttribute("resultado", resultado);
                  response.sendRedirect("/SICOV/Modulos/Conductores.jsp");
    }
*/

