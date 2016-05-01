package AccesoDatos;
import Beans.Accesorios_Vehiculo;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class GuardarAccesorio extends HttpServlet {
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
        Accesorios_Vehiculo ac = new Accesorios_Vehiculo();
        String error = null;
        ac.setPlaca(request.getParameter("placaAC"));
        ac.setFecha(request.getParameter("fechaAC"));
        ac.setUsuario(request.getParameter("usuarioAC"));
        ac.setNombreAccesorio(request.getParameter("nombreAC"));
        ac.setFoto(request.getParameter("imagenAC"));
        ac.setDescrip(request.getParameter("descripcionAC"));
        String sentencia = "INSERT INTO dbo.accesorios (PLACA,FECHA,USUARIO,NACCESORIO,FOTO,DESCRIPCION) VALUES('"+ac.getPlaca()+"','"+ac.getFecha()+"','"+ac.getUsuario()+"','"+ac.getNombreAccesorio()+"','"+ac.getFoto()+"','"+ac.getDescrip()+"')";
        Consulta c = new Consulta();
        c.ejecutarConsultas(sentencia,10);
        error = c.getResultado();
        //request.setAttribute("error", error);
        //request.getRequestDispatcher("/Error.jsp").forward(request, response);
        response.sendRedirect("./Modulos/Vehiculos.jsp");
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

}
