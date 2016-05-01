package AccesoDatos;
import Beans.Solicitudes_Entrantes;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Buzon_Solicitudes extends HttpServlet {
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
        Solicitudes_Entrantes st = new Solicitudes_Entrantes();
  
        String resultado = null;
        
       st.setUsuario(request.getParameter("usuarioST"));
       st.setFechaRecibido(request.getParameter("fechaRecibidoST"));
       st.setEncargado(request.getParameter("encargadoST"));
       st.setEmailEncargado(request.getParameter("emailEncargadoST"));
       st.setFechaSalida(request.getParameter("fechaSalidaST"));
       st.setFechaRegreso(request.getParameter("fechaRegresoST"));
       st.setHoraSalida(request.getParameter("horaSalidaST"));
       st.setHoraRegreso(request.getParameter("horaRegresoST"));
       st.setDuracionEstimada(request.getParameter("duracionEstimadaST"));
       st.setDestino(request.getParameter("destinoST"));
       st.setDepartamento(request.getParameter("departamentoST"));
       st.setExtensionEncargado(request.getParameter("extensionST"));
       st.setCantidadPasajeros(request.getParameter("numeroUsuariosST"));
       st.setNombrePasajeros(request.getParameter("nombreUsuariosST"));
       st.setObservaciones(request.getParameter("observacionesST"));
       st.setEstado("pendiente");
       
       
       
        String sentencia = "INSERT INTO dbo.buzon_solicitudes(USUARIO,FECHA_RECIBIDO,ENCARGADO,EMAIL_ENCARGADO,FECHA_SALIDA,FECHA_REGRESO,HORA_SALIDA,HORA_REGRESO,DURACION_ESTIMADA,DESTINO,DEPARTAMENTO,EXTENSION,NUMERO_USUARIOS,NOMBRE_USUARIOS,OBSERVACIONES,ESTADO_SOLICITUD) VALUES('"+st.getUsuario()+"','"+st.getFechaRecibido()+"','"+st.getEncargado()+"','"+st.getEmailEncargado()+"','"+st.getFechaSalida()+"','"+st.getFechaRegreso()+"','"+st.getHoraSalida()+"','"+st.getHoraRegreso()+"','"+st.getDuracionEstimada()+"','"+st.getDestino()+"','"+st.getDepartamento()+"','"+st.getExtensionEncargado()+"','"+st.getCantidadPasajeros()+"','"+st.getNombrePasajeros()+"','"+st.getObservaciones()+"','pendiente')";
        Consulta c = new Consulta();
        c.ejecutarConsultas(sentencia,10);
        resultado = c.getResultado();
          /*request.setAttribute("resultado",resentencia);*/
        request.setAttribute("resultado",resultado);
        //RequestDispatcher emisor = getServletContext().getRequestDispatcher("/Modulos/Solicitudes.jsp");
        response.sendRedirect("./Modulos/Solicitudes.jsp");
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
