package AccesoDatos;

import Beans.Vehiculo;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExpVehiculo extends HttpServlet {

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
        Vehiculo v = new Vehiculo();
        String resultado = null;
        
        //short estadoVehiculo = Short.parseShort(request.getParameter(""));
        //v.setEstadoVehiculo(estadoVehiculo);
        v.setUsuario(request.getParameter("usuario"));
        v.setFechaRecibido(request.getParameter("fechaHoy"));
        v.setPlaca(request.getParameter("placa"));
        v.setChasis(request.getParameter("chasis"));
        v.setMotor(request.getParameter("motor"));
        short yearVehiculo = Short.parseShort(request.getParameter("year"));
        v.setYearVehiculo(yearVehiculo);
        v.setFechaInscripcion(request.getParameter("fechaInscripcion"));
        short tomo = Short.parseShort(request.getParameter("tomo"));
        v.setTomo(tomo);
        short folio = Short.parseShort(request.getParameter("folio"));
        v.setFolio(folio);
        short asiento = Short.parseShort(request.getParameter("asiento"));
        v.setAsiento(asiento);
        short valorFiscal = Short.parseShort(request.getParameter("valorFiscal"));
        v.setValorFiscal(valorFiscal);
        
        v.setFotoVehiculo(request.getParameter("fotoVehiculo"));
        v.setMarca(request.getParameter("marca"));
        v.setModelo(request.getParameter("modelo"));
        v.setColor(request.getParameter("color"));
        v.setCombustible(request.getParameter("combustible"));
        v.setEstilo(request.getParameter("estilo"));
        short numeroPasajeros = Short.parseShort(request.getParameter("cilindrada"));
        v.setNumeroPasajeros(numeroPasajeros);
        short cilindrada = Short.parseShort(request.getParameter("cantidadPasajeros"));
        v.setCilindrada(cilindrada);
        v.setProxRtv(request.getParameter("proxRtv"));
        v.setEstadoRtv(request.getParameter("estadoRtv"));
        
        
        String sentencia = "INSERT INTO dbo.exp_vehiculos(USUARIO,FECHA_RECIBIDO,PLACA,CHASIS,MOTOR,YEAR,FECHA_INSCRIPCION,TOMO) VALUES('"+v.getUsuario()+"','"+v.getFechaRecibido()+"','"+v.getPlaca()+"','"+v.getChasis()+"','"+v.getMotor()+"',"+v.getYearVehiculo()+",'"+v.getFechaInscripcion()+"',"+v.getTomo()+")";


        Consulta c = new Consulta();
        c.ejecutarConsultas(sentencia,10);
        resultado = c.getResultado();
        /*request.setAttribute("resultado",resentencia);*/
        request.setAttribute("resultado",resultado);
        RequestDispatcher emisor = getServletContext().getRequestDispatcher("/Modulos/Vehiculos.jsp");
        
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
