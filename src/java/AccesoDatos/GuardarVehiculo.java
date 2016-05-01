package AccesoDatos;
import Beans.Expediente_Vehiculo;
import Conexion.Consulta;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuardarVehiculo extends HttpServlet {
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
        
            Expediente_Vehiculo ev = new Expediente_Vehiculo();
            String resultado = null;
       
       ev.setUsuario(request.getParameter("usuarioEV"));
       ev.setFechaRecibido(request.getParameter("fechaHoyEV"));
       ev.setPlaca(request.getParameter("placaEV"));
       ev.setChasis(request.getParameter("chasisEV"));
       ev.setMotor(request.getParameter("motorEV"));
       ev.setYearVehicle(request.getParameter("yearEV"));
       ev.setFechaInscripcion(request.getParameter("fechaInscripcionEV"));
       ev.setTomo(request.getParameter("tomoEV"));
       ev.setFolios(request.getParameter("folletoEV"));
       ev.setAsientos(request.getParameter("asientoEV"));
       ev.setValorFiscal(request.getParameter("valorFiscalEV"));
       ev.setFotoVehiculo(request.getParameter("fotoVehiculoEV"));
       ev.setCodMarca(request.getParameter("marcaEV"));
       ev.setCodModelo(request.getParameter("modeloEV"));
       ev.setCodColor(request.getParameter("colorEV"));
       ev.setCodCombustible(request.getParameter("combustibleEV"));
       ev.setCodEstilo(request.getParameter("estiloEV"));
       ev.setCilindrada(request.getParameter("cilindradaEV"));
       ev.setCantidadPasajeros(request.getParameter("cantidadPasajerosEV"));
       ev.setProxRtv(request.getParameter("proxRtvEV"));
       ev.setEstadoRtv(request.getParameter("estadoRtvEV"));
       
      // ev.setFechaAlta(request.getParameter(""));
       
      
       //String sentencia = "INSERT INTO dbo.exp_carros(USUARIO,FECHA_RECIBIDO,PLACA,CHASIS,MOTOR,YEAR,FECHA_INSCRIPCION,TOMO,FOLIO,ASIENTO,VALOR_FISCAL,COD_DEPARTAMENTO,COD_PROPIETARIO,CEDULA_CONDUCTOR,FOTO_VEHICULO) VALUES('"+ev.getUsuario()+"','"+ev.getFechaRecibido()+"','"+ev.getPlaca()+"','"+ev.getChasis()+"','"+ev.getMotor()+"','"+ev.getYearVehicle()+"','"+ev.getFechaInscripcion()+"','"+ev.getTomo()+"','"+ev.getFolios()+"','"+ev.getAsientos()+"','"+ev.getValorFiscal()+"','"+ev.getCodigoDepartamento()+"','"+ev.getCodigoPropietario()+"','"+ev.getCedulaConductor()+"','"+ev.getFotoVehiculo()+"')";
       String sentencia = "INSERT INTO dbo.exp_naves(USUARIO,FECHA_RECIBIDO,PLACA,CHASIS,MOTOR,YEAR,FECHA_INSCRIPCION,TOMO,FOLIO,ASIENTO,VALOR_FISCAL,FOTO_VEHICULO,COD_MARCA,COD_MODELO,COD_COLOR,COD_COMBUSTIBLE,COD_ESTILO,CILINDRADA,CANTIDAD_PASAJEROS,PROX_RTV,ESTADO_RTV) VALUES('"+ev.getUsuario()+"','"+ev.getFechaRecibido()+"','"+ev.getPlaca()+"','"+ev.getChasis()+"','"+ev.getMotor()+"','"+ev.getYearVehicle()+"','"+ev.getFechaInscripcion()+"','"+ev.getTomo()+"','"+ev.getFolios()+"','"+ev.getAsientos()+"','"+ev.getValorFiscal()+"','"+ev.getFotoVehiculo()+"','"+ev.getCodMarca()+"','"+ev.getCodModelo()+"','"+ev.getCodColor()+"','"+ev.getCodCombustible()+"','"+ev.getCodEstilo()+"','"+ev.getCilindrada()+"','"+ev.getCantidadPasajeros()+"','"+ev.getProxRtv()+"','"+ev.getEstadoRtv()+"')";

        Consulta c = new Consulta();
        c.ejecutarConsultas(sentencia,10);
        resultado = c.getResultado();
        /*request.setAttribute("resultado",resentencia);*/
        request.setAttribute("resultado",resultado);
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
