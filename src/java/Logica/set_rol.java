package Logica;import Beans.Usuario;import Conexion.Consulta;import java.io.IOException;import javax.servlet.ServletException;import javax.servlet.http.HttpServlet;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class set_rol extends HttpServlet {
    String resultado="default";
    int prueba ;
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
        
        Usuario u = new Usuario();
        u.setUsername(request.getParameter("uedit"));
        if("on".equals(request.getParameter("sadm"))){u.setMod_Solicitudes_adm(true);}
        if("on".equals(request.getParameter("suser"))){u.setMod_Solicitudes_user(true);}
        if("on".equals(request.getParameter("vh"))){u.setMod_Vehiculos(true);}
        if("on".equals(request.getParameter("cn"))){u.setMod_Conductores(true);}
        if("on".equals(request.getParameter("cm"))){u.setMod_Combustible(true);}
        if("on".equals(request.getParameter("ruser"))){u.setMod_Usuarios_sist(true);}
        u.setMod_Consultas_Sist(false);
        u.setDatabase_role("adm");
        ActualizarRoles(u);
        HttpSession session = request.getSession();
        Usuario ulog = (Usuario) session.getAttribute("usuario");
        if( ulog.getUsername().equals(u.getUsername()) ){ session.setAttribute("usuario", u); }
        request.setAttribute("resultado", resultado );
        response.sendRedirect("./usuarios?code=succes");
          
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
       String sentencia = "UPDATE SICOV.dbo.usuarios SET \"usuarios_mod_sl_adm\" = "+v[0]
               +", \"usuarios_mod_sl_user\" = "+v[1]
               +", \"usuarios_mod_vh\" = "+v[2]
               +", \"usuarios_mod_cn\" = "+v[3]
               +", \"usuarios_mod_cm\" = "+v[4]
               +", \"usuarios_mod_user_sist\" = "+v[5]
               +", \"usuarios_mod_consultas\" = "+v[6]
               +", \"usuarios_db_role\" = 'adm' WHERE usuarios_id = '"+u.getUsername()+"';";
       c.ejecutarConsultas(sentencia, 10);
       resultado = c.getResultado();
    }
}
