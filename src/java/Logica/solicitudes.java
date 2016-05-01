package Logica;import Beans.Solicitud;
import Beans.Solicitud_Transporte;
import Beans.Solicitudes_Entrantes;
import Conexion.Consulta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class solicitudes extends HttpServlet {
    String resultado = null;
    Solicitud s = new Solicitud();
    Solicitud_Transporte x = new Solicitud_Transporte();
    Solicitudes_Entrantes se = new Solicitudes_Entrantes();
 
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
            
            case "6" :{request.setAttribute("listaBuzon", Solicitudes_buzon() );
            request.getRequestDispatcher("/Modulos/Buzon_Solicitudes.jsp").forward(request, response);
            break;}
            case "7" :{request.setAttribute("resultado", resultado);break;}
            default  :{ request.setAttribute("listaBuzon", Solicitudes_buzon() );
            request.getRequestDispatcher("/Modulos/Buzon_Solicitudes.jsp").forward(request, response);break;}    
        }
        
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

    private ArrayList<Solicitud> Buzon_solicitudes()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.solicitudes";

        c.ejecutarConsultas(sentencia, 3);
        ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
        listaSol = c.getListaSol();
        //subversion
        return listaSol;
    }
    private ArrayList<Solicitud> Solicitudes_aprobadas()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.solicitudes";

        c.ejecutarConsultas(sentencia, 3);
        ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
        listaSol = c.getListaSol();
        
        return listaSol;
    }
    private ArrayList<Solicitud_Transporte> Buscar_En_Curso()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.solicitudes_transporte";

        c.ejecutarConsultas(sentencia, 5);
        ArrayList<Solicitud_Transporte> listaDeneg = new ArrayList<Solicitud_Transporte>();
        listaDeneg = c.getListaDeneg();
        
        return listaDeneg;
    }
    private ArrayList<Solicitud> Buscar_Aprobadas()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.solicitudes";

        c.ejecutarConsultas(sentencia, 4);
        ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
        listaSol = c.getListaSol();
        
        return listaSol;
    }
    
    private ArrayList<Solicitud> Buscar_denegadas()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.solicitudes";

        c.ejecutarConsultas(sentencia, 4);
        ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
        listaSol = c.getListaSol();
        
        return listaSol;
    }
    
    private ArrayList<Solicitudes_Entrantes> Solicitudes_buzon()
    {
        Consulta c = new Consulta();
        String sentencia = "select * from dbo.buzon_solicitudes where ESTADO_SOLICITUD = 'pendiente' ";

        c.ejecutarConsultas(sentencia, 6);
        ArrayList<Solicitudes_Entrantes> listaBuzon = new ArrayList<Solicitudes_Entrantes>();
        listaBuzon = c.getListaBuzon();
        
            return listaBuzon;
    }
}
