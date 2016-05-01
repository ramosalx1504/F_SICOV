package AccesoDatos;
import Beans.Solicitud_Transporte;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Salvar_Solicitud extends HttpServlet {

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
       Solicitud_Transporte st = new Solicitud_Transporte();
       String resultado = null;  
       st.setFechaSalida(request.getParameter("fechaS"));
       st.setFechaRegreso(request.getParameter("fechaR"));
       st.setDuracionEstimada(request.getParameter("duracionEstimada"));
       st.setHoraSalida(request.getParameter("horaS"));
       st.setHoraRegreso(request.getParameter("horaR"));
       st.setDestino(request.getParameter("destino"));
       st.setDepartamento(request.getParameter("departamento"));
       st.setExtension(request.getParameter("extension"));
       st.setUser1(request.getParameter("nombreUsuario1"));
       st.setUser2(request.getParameter("nombreUsuario2"));
       st.setUser3(request.getParameter("nombreUsuario3"));
       st.setUser4(request.getParameter("nombreUsuario4"));
       st.setUser5(request.getParameter("nombreUsuario5"));
       st.setUser6(request.getParameter("nombreUsuario6"));
       st.setObservaciones(request.getParameter("observaciones"));
       
        
        
         String sentencia = "INSERT INTO dbo.solicitudes_transporte(FECHA_SALIDA,FECHA_REGRESO,HORA_SALIDA,HORA_REGRESO,DURACION_ESTIMADA,DESTINO,DEPARTAMENTO,EXTENSION,USUARIO1,USUARIO2,USUARIO3,USUARIO4,USUARIO5,USUARIO6,OBSERVACIONES) VALUES('"+st.getFechaSalida()+"','"+st.getFechaRegreso()+"','"+st.getHoraSalida()+"','"+st.getHoraRegreso()+"','"+st.getDuracionEstimada()+"','"+st.getDestino()+"','"+st.getDepartamento()+"','"+st.getExtension()+"','"+st.getUser1()+"','"+st.getUser2()+"','"+st.getUser3()+"','"+st.getUser4()+"','"+st.getUser5()+"','"+st.getUser6()+"','"+st.getObservaciones()+"')";
      // String sentencia = "INSERT INTO dbo.solicitudes(NUMERO_SOLICITUD,FECHA_SALIDA,FECHA_REGRESO,HORA_SALIDA,HORA_REGRESO,DURACION_ESTIMADA,DESTINO,PROVINCIA,CANTON,DISTRITO,DEPARTAMENTO,EXTENSION,NUMERO_USUARIOS,NOMBRE_USUARIOS,OBSERVACIONES) VALUES("+s.getNumeroSolicitud()+",'"+s.getFechaSalida()+"','"+s.getFechaRegreso()+"','"+s.getHoraSalida()+"','"+s.getHoraRegreso()+"','"+s.getDuracionEstimada()+"','"+s.getDestino()+"','"+s.getProvincia()+"','"+s.getCanton()+"','"+s.getDistrito()+"','"+s.getDepartamento()+"',"+s.getExtension()+","+s.getNumeroUsuarios()+",'"+s.getNombreUsuarios()+"','"+s.getObservaciones()+"')";
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
