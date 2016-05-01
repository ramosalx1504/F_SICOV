package Logica;
import Beans.Usuario;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Login extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    String alerta = null;
    Usuario userdb = new Usuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        switch(request.getParameter("code"))
        {
        case "1" : 
        { 
            if(Login(request.getParameter("usuario"),request.getParameter("pass")))
            {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", userdb);
                
                sesion.setMaxInactiveInterval(300);
                response.sendRedirect("./Main.jsp");
            }
            else{ request.setAttribute("alerta", alerta); request.getRequestDispatcher("/index.jsp").forward(request, response);}
            break;
        }
        case "2" : 
        { 
            HttpSession actual = request.getSession();
            actual.removeAttribute("usuario");
            actual.invalidate();
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            break;
        }
        case "3" : {alerta = "<div class=\"alert alert-info col-md-2\"> Desconectado <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>"; request.setAttribute("alerta", alerta); request.getRequestDispatcher("/index.jsp").forward(request, response);break;}
        
        case "4" : {alerta = "<div class=\"alert alert-warning\"> Usted ha sido desconectado por Inactividad <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>";request.setAttribute("alerta", alerta); request.getRequestDispatcher("/index.jsp").forward(request, response); break;}
        case "999" : {alerta = "<div class=\"alert alert-warning\"> <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>"; request.setAttribute("alerta", alerta); request.getRequestDispatcher("/index.jsp").forward(request, response);break;}
        default  : {alerta = "<div class=\"alert alert-danger\"> Acción no Encontrada <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>"; request.setAttribute("alerta", alerta); request.getRequestDispatcher("/index.jsp").forward(request, response); break;}
        }   
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

    private boolean Login(String u, String p)
    {
        Consulta c = new Consulta();
        String sentencia = "SELECT * FROM dbo.usuarios where usuarios_id ='"+u+"'";
        
        c.ejecutarConsultas(sentencia,1);
        
        if(c.getResultado().equals("Encontrado"))
        {
            alerta = "<div class=\"alert alert-danger col-md-4\"> Contraseña incorrecta! Intenta de nuevo! <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>";
            if(p.equals(c.getUserDB().getPassword())){ userdb=c.getUserDB();userdb.setPassword(""); return true;}
        }
        else
        {
            alerta = "<div class=\"alert alert-danger col-md-4\"> Datos no encontrados! Intenta de nuevo! <button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button> </div>";     
        }
    return false;
    }
    
    
}
