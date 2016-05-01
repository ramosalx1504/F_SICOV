package Logica;import Beans.Usuario;
import Conexion.Consulta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;import javax.servlet.http.HttpServlet;import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class usuarios extends HttpServlet {
    String resultado ="";
    String prueba="";
    Usuario u = new Usuario();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        switch(request.getParameter("code"))
        {
            case "0": resultado="<div>Bienvenido al módulo de mantenimiento de usuario!. Selecione una opción del menú a su izquierda para comenzar.</div>"; break;
            case "1": resultado= getFormulario(); break;
            case "2": {request.setAttribute("lista", getUsuarios() ); break;}
            case "succes": {resultado= "Acción realizada con éxito!" ; break;}
            default:  resultado="Error! Acción no encontrada"; break;
        }
        
        request.setAttribute("resultado", resultado);
        request.getRequestDispatcher("/Modulos/Usuarios.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        request.setAttribute("lista", getUsuariosPorNombre(request.getParameter("texto")));
        request.setAttribute("resultado", resultado);
        
        
        request.getRequestDispatcher("/Modulos/Usuarios.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

private String getFormulario()
    {
     StringBuilder html = new StringBuilder();
     
     html.append("<div class=\"row\">\n" +
"	<div class=\"col-md-5\">\n" +
"	<p class=\"parrafo-info\">Digite el nombre del usuario que desea modificar :</p>\n" +
"	<form method=\"POST\" id='formLOGIN'>\n" +
"	<div class=\"input-group\">\n" +
"	<input type=\"text\" class=\"validate[required,maxSize[25],custom[onlyLetterSp]] form-control\" id=\"texto\" name=\"texto\" placeholder=\"Nombre:\" autocomplete=\"off\" maxlength='26'></input>\n" +
"	<span class=\"input-group-btn\">\n" +
"        <button class=\"btn btn-default\" type=\"button\">?</button>\n" +
"        <button class=\"btn btn-primary\" type=\"submit\">Buscar</button>\n" +
"      </span>\n" +
"       </div>\n" +
"	</form>	\n" +
"       </div>\n" +
"        </div>");
    
    return html.toString();
    }
    
    private ArrayList<Usuario> getUsuarios()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.usuarios";
        c.ejecutarConsultas(sentencia,2);
        
        ArrayList<Usuario>  lista = c.getListau();
        resultado = c.getResultado();
        return lista;
    }

    private ArrayList<Usuario> getUsuariosPorNombre(String n)
    {
        Consulta c = new Consulta();
        String sentencia = "SELECT * FROM dbo.usuarios where usuarios_id ='"+n+"'";
        c.ejecutarConsultas(sentencia,3);
        
        ArrayList<Usuario>  lista = c.getListau();
        resultado = c.getResultado();
        return lista;
    }
    
    private void ActualizarRoles(Usuario u)
    {
       Consulta c = new Consulta();
       int []v = new int[7];
       for(int i=0;i<7;i++){v[i]=0;}
       if(u.isMod_Solicitudes_adm()){v[0]=1;}
       if(u.isMod_Solicitudes_user()){v[1]=1;}
       if(u.isMod_Vehiculos()){v[2]=1;}
       if(u.isMod_Conductores()){v[3]=1;}
       if(u.isMod_Combustible()){v[4]=1;}
       if(u.isMod_Usuarios_sist()){v[5]=1;}
       if(u.isMod_Consultas_Sist()){v[6]=1;}
       String sentencia = "UPDATE SICOV.dbo.usuarios SET 'usuarios_mod_sl_adm' = "+v[0]+", 'usuarios_mod_sl_user' = "+v[1]+", 'usuarios_mod_vh' = "+v[2]+", 'usuarios_mod_cn' = "+v[3]+", 'usuarios_mod_cm' = "+v[4]+", 'usuarios_mod_user_sist' = "+v[6]+", 'usuarios_mod_consultas' = "+v[6]+", 'usuarios_db_role' = 'adm' WHERE usuarios_id = '"+u.getUsername()+"';";
       c.ejecutarConsultas(sentencia, 10);
       prueba= u.getUsername();
       resultado = c.getResultado();
    }
}
