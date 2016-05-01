package AccesoDatos;
import Beans.Solicitud;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuardarSolicitud extends HttpServlet {

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
         Solicitud s = new Solicitud();
  
        String resultado = null;
        
        
        /*s.setCedula(request.getParameter("id"));*/
       int numeroSolicitud = Integer.parseInt(request.getParameter("numSolicitud"));
       s.setNumeroSolicitud(numeroSolicitud);
       s.setFechaSalida(request.getParameter("fechaS"));
       s.setFechaRegreso(request.getParameter("fechaR"));
       s.setDuracionEstimada(request.getParameter("duracionEstimada"));
       s.setHoraSalida(request.getParameter("horaS"));
       s.setHoraRegreso(request.getParameter("horaR"));
       s.setDestino(request.getParameter("destino"));
       s.setProvincia(request.getParameter("provincia"));
       s.setCanton(request.getParameter("canton"));
       s.setDistrito(request.getParameter("distrito"));
       s.setDepartamento(request.getParameter("departamento"));
       int extension = Integer.parseInt(request.getParameter("extension"));
       s.setExtension(extension);
       int numUsuarios = Integer.parseInt(request.getParameter("numeroUsuarios"));
       s.setNumeroUsuarios(numUsuarios);
       s.setNombreUsuarios(request.getParameter("nombreoUsuarios"));
       s.setObservaciones(request.getParameter("observaciones"));
       
        
        
        String sentencia = "INSERT INTO dbo.solicitudes(NUMERO_SOLICITUD,FECHA_SALIDA,FECHA_REGRESO,HORA_SALIDA,HORA_REGRESO,DURACION_ESTIMADA,DESTINO,PROVINCIA,CANTON,DISTRITO,DEPARTAMENTO,EXTENSION,NUMERO_USUARIOS,NOMBRE_USUARIOS,OBSERVACIONES) VALUES("+s.getNumeroSolicitud()+",'"+s.getFechaSalida()+"','"+s.getFechaRegreso()+"','"+s.getHoraSalida()+"','"+s.getHoraRegreso()+"','"+s.getDuracionEstimada()+"','"+s.getDestino()+"','"+s.getProvincia()+"','"+s.getCanton()+"','"+s.getDistrito()+"','"+s.getDepartamento()+"',"+s.getExtension()+","+s.getNumeroUsuarios()+",'"+s.getNombreUsuarios()+"','"+s.getObservaciones()+"')";
        Consulta c = new Consulta();
        c.ejecutarConsultas(sentencia,10);
        resultado = c.getResultado();
          /*request.setAttribute("resultado",resentencia);*/
        request.setAttribute("resultado",resultado);
        RequestDispatcher emisor = getServletContext().getRequestDispatcher("/Modulos/Solicitudes.jsp");
        emisor.forward(request, response);
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
