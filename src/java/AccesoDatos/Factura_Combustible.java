package AccesoDatos;

import Beans.Factura_Gasolina;
import Conexion.Consulta;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Factura_Combustible extends HttpServlet {

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
        Factura_Gasolina fc = new Factura_Gasolina();       
        fc.setUsuario(request.getParameter("usuario"));
        fc.setFechaRecibido(request.getParameter("fechaIngreso"));
        fc.setPlacaVehiculo(request.getParameter("placa"));
        fc.setFormaPago(request.getParameter("tipoPago"));
        fc.setNumeroTarjeta(request.getParameter("numeroTarjeta"));
        //fc.setEstadoBancos(request.getParameter("estadoBancos"));
        //fc.setFechaFacturaCombustible(request.getParameter("fechaIngreso"));
        fc.setNumeroFacturaCombustible(request.getParameter("numeroFactura"));
        fc.setMontoCompraCombustible(request.getParameter("montoFactura"));
        fc.setCedulaEstacion(request.getParameter("numeroEstacion"));
        fc.setNombreEstacion(request.getParameter("nombreEstacion"));
        fc.setKilometraje(request.getParameter("kilometraje"));
        fc.setLitros(request.getParameter("litros"));
        fc.setFotoVoucher(request.getParameter("inFotoVoucher"));
        
        if(fc.getNumeroTarjeta() == null){
           fc.setNumeroTarjeta("");
        }
        Date fechafact = java.sql.Date.valueOf(fc.getFechaRecibido());
       
       
      
       //String sentencia = "INSERT INTO dbo.exp_carros(USUARIO,FECHA_RECIBIDO,PLACA,CHASIS,MOTOR,YEAR,FECHA_INSCRIPCION,TOMO,FOLIO,ASIENTO,VALOR_FISCAL,COD_DEPARTAMENTO,COD_PROPIETARIO,CEDULA_CONDUCTOR,FOTO_VEHICULO) VALUES('"+ev.getUsuario()+"','"+ev.getFechaRecibido()+"','"+ev.getPlaca()+"','"+ev.getChasis()+"','"+ev.getMotor()+"','"+ev.getYearVehicle()+"','"+ev.getFechaInscripcion()+"','"+ev.getTomo()+"','"+ev.getFolios()+"','"+ev.getAsientos()+"','"+ev.getValorFiscal()+"','"+ev.getCodigoDepartamento()+"','"+ev.getCodigoPropietario()+"','"+ev.getCedulaConductor()+"','"+ev.getFotoVehiculo()+"')";
        //String sentencia = "INSERT INTO dbo.facturas_combustible(CONSECUTIVO,USUARIO,FECHA_RECIBIDO,PLACA,TIPO_PAGO,NUMERO_TARJETA,ESTADO_BANCOS,FECHA_FACTURA,NUMERO_FACTURA,MONTO_COMPRA,CEDULA_ESTACION,NOMBRE_ESTACION,KILOMETRAJE,LITROS,FOTO_VOUCHER) VALUES(SELECT COUNT(*) FROM dbo.facturas_combustible,'"+fc.getUsuario()+"','"+fc.getFechaRecibido()+"','"+fc.getPlacaVehiculo()+"','"+fc.getFormaPago()+"','"+fc.getNumeroTarjeta()+"','','"+fc.getFechaFacturaCombustible()+"','"+fc.getNumeroFacturaCombustible()+"','"+fc.getMontoCompraCombustible()+"','"+fc.getCedulaEstacion()+"','"+fc.getNombreEstacion()+"','"+fc.getKilometraje()+"','"+fc.getLitros()+"','"+fc.getFotoVoucher()+"')";
        String sentencia = "INSERT INTO dbo.facturas_combustible(USUARIO,FECHA_RECIBIDO,PLACA,TIPO_PAGO,NUMERO_TARJETA,ESTADO_BANCOS,NUMERO_FACTURA,MONTO_COMPRA,CEDULA_ESTACION,NOMBRE_ESTACION,KILOMETRAJE,LITROS,FOTO_VOUCHER) VALUES('"+fc.getUsuario()+"','"+ fechafact +"','"+fc.getPlacaVehiculo()+"','"+fc.getFormaPago()+"','"+fc.getNumeroTarjeta()+"','','"+fc.getNumeroFacturaCombustible()+"','"+fc.getMontoCompraCombustible()+"','"+fc.getCedulaEstacion()+"','"+fc.getNombreEstacion()+"','"+fc.getKilometraje()+"','"+fc.getLitros()+"','"+fc.getFotoVoucher()+"')";
        System.out.println(sentencia);
        Consulta c = new Consulta();
        c.ingresaFactura(sentencia);
        //resultado = c.getResultado();
        //request.setAttribute("resultado",resultado);
        
        //RequestDispatcher emisor = getServletContext().getRequestDispatcher("/Modulos/Combustible.jsp");
         response.sendRedirect("/F_SICOV/Modulos/Combustible.jsp");
        
         //emisor.forward(request, response);
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
