package Logica;import Beans.Solicitudes_Entrantes;
import Conexion.Consulta;
import java.io.IOException;import java.util.ArrayList;
import javax.servlet.ServletException;import javax.servlet.http.HttpServlet;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;

public class Buzon extends HttpServlet {
    String resultado = "";
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
        
         switch(request.getParameter("trace"))
        {
             case "show": { resultado = getSolicitud_Modal(request.getParameter("id")); request.setAttribute("trace","show"); break;}
             case "tramitar": { resultado = "tramitar"; request.setAttribute("trace","tramitar"); break;}
             case "denegar": { Denegar_Solicitud(request.getParameter("id")); request.setAttribute("trace","success"); break;}
             default : { resultado = "Acción no válida!"; request.setAttribute("trace","default"); break; }
        }
        request.setAttribute("resultado", resultado);
        request.getRequestDispatcher("/Modulos/TramiteSolicitudes.jsp").forward(request, response);
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
    private void Denegar_Solicitud(String numero)
    {
        Consulta c = new Consulta();
        String sentencia = "UPDATE dbo.buzon_solicitudes SET \"ESTADO_SOLICITUD\" = 'denegada' WHERE NUMERO = '"+numero+"'";
        c.ejecutarConsultas(sentencia,10);
        resultado = c.getResultado();
    }
    private String getSolicitud_Modal(String numero)
    {
     Consulta c = new Consulta();
     String sentencia = "select * from dbo.buzon_solicitudes where NUMERO = '"+numero+"' ";

     c.ejecutarConsultas(sentencia, 6); 
     
     
     
     ArrayList<Solicitudes_Entrantes> listaBuzon = new ArrayList<Solicitudes_Entrantes>();
     listaBuzon = c.getListaBuzon();
           
     StringBuilder html = new StringBuilder();
     
     html.append("<h3 style='margin: 20px 0 20px !important' class=\"page-header\">Solicitud número : <span style='color:green;'><i>").append(numero).append("</i></span><div class=\"pull-right\" role=\"group\" ><a href='./solicitudes?code=6' class='btn btn-default btn-xs'>Volver</a> <a  class='btn btn-danger btn-xs' role=\"button\" data-toggle=\"modal\" data-target=\"#confirmar\">Denegar</a> <a href=\"./Buzon?trace=tramitar&id=").append(numero).append("\" class='btn btn-success btn-xs'>Tramitar</a> </div></h3>");
     
     html.append("<div class=\"row\">\n" +
"                                        <div class=\"col-sm-12\">\n" +
"                                           \n" +
"                                                <div class=\"row\">\n" +
"							<div class=\"col-sm-3 form-group\">\n" +
"								<label>Usuario que ingresó la Solicitud: </label>\n" +
"                                                                <input name=\"usuarioST\" type=\"text\" value=\"").append(listaBuzon.get(0).getUsuario()).append("\" class=\"form-control\" readonly>\n" +
"                                                        </div>\n" +
"                                                        <div class=\"col-sm-3 form-group\">\n" +
"								<label>Jefe de Departamento: </label>\n" +
"                                                                <input name=\"jefeDepartamento\" type=\"text\" value=\"Olman\" class=\"form-control\" readonly>\n" +
"                                                        </div>\n" +
"							<div class=\"col-sm-3 form-group\">\n" +
"								<label>Fecha de Recibido: </label>\n" +
"                                                                <input name=\"fechaRecibidoST\" value=\"").append(listaBuzon.get(0).getFechaRecibido()).append("\" class=\"form-control\" readonly>\n" +
"                                                        </div>\n" +
"                                                        <div class=\"form-group col-sm-3\">\n" +
"                                                        <label>Estado de Solicitud: </label>\n" +
"                                                        <input class=\"form-control\" type=\"text\" name=\"estado\" value=\"").append(listaBuzon.get(0).getEstado()).append("\" readonly>\n" +
"                                                        </div>  \n" +
"                                                         \n" +
"                                                </div>\n" +
"                                                <div class=\"row\">\n" +
"							<div class=\"col-sm-6 form-group\">\n" +
"								<label>Encargado: </label>\n" +
"								<input type=\"text\" name=\"encargado\" value=\"\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"							<div class=\"col-sm-6 form-group\">\n" +
"								<label>Email del Encargado: </label>\n" +
"								<input type=\"text\" name=\"emailEncargado\" value=\"\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"                                                         \n" +
"                                                </div>\n" +
"						<div class=\"row\">\n" +
"							<div class=\"col-sm-4 form-group\">\n" +
"								<label>Fecha de Salida: </label>\n" +
"								<input type=\"text\" name=\"fechaSalida\" value=\"").append(listaBuzon.get(0).getFechaSalida()).append("\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"							<div class=\"col-sm-4 form-group\">\n" +
"								<label>Fecha de Regreso: </label>\n" +
"								<input type=\"text\" name=\"fechaRegreso\" value=\"").append(listaBuzon.get(0).getFechaRegreso()).append("\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"                                                         <div class=\"col-sm-4 form-group\">\n" +
"                                                                <label>Duración Estimada: </label>\n" +
"                                                                <input type=\"text\" name=\"duracionEstimada\" value=\"").append(listaBuzon.get(0).getDuracionEstimada()).append("\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>\n" +
"                                                </div>\n" +
"                                                <div class=\"row\">\n" +
"							<div class=\"col-sm-4 form-group\">\n" +
"								<label>Hora de Salida: </label>\n" +
"								<input type=\"text\" name=\"horaSalida\" value=\"").append(listaBuzon.get(0).getHoraSalida()).append("\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"							<div class=\"col-sm-4 form-group\">\n" +
"								<label>Hora de Regreso: </label>\n" +
"								<input type=\"text\" name=\"horaRegreso\" value=\"").append(listaBuzon.get(0).getHoraRegreso()).append("\" readonly=\"\" class=\"form-control\">\n" +
"                                                        </div>	\n" +
"                                                </div>\n" +
"                                                <div class=\"row\">	\n" +
"						<div class=\"form-group col-sm-12\">\n" +
"							<label>Destino: </label>\n" +
"							<input type=\"text\" name=\"destino\" value=\"").append(listaBuzon.get(0).getDestino()).append("\" readonly=\"\" class=\"form-control\">\n" +
"						</div>	\n" +
"                                                </div>\n" +
"                                                <div class=\"row\">\n" +
"                                                   \n" +
"                                                          <div class=\"form-group col-sm-4\">\n" +
"                                                              <label>Departamento del Encargado: </label>\n" +
"							<input type=\"text\" name=\"departamento\" value=\"").append(listaBuzon.get(0).getDepartamento()).append("\" readonly class=\"form-control\">\n" +
"                                                         </div>\n" +
"							<div class=\"form-group col-sm-4\">\n" +
"                                                        <label>Extensión del Encargado: </label>\n" +
"							<input type=\"text\" name=\"extension\" value=\"").append(listaBuzon.get(0).getExtensionEncargado()).append("\" readonly class=\"form-control\">\n" +
"                                                        </div>\n" +
"                                                       \n" +
"						</div>\n" +
"                                                <div class=\"row\">\n" +
"							<div class=\"col-sm-4 form-group\">\n" +
"							<label>Cantidad de Pasajeros: </label>\n" +
"							<input type=\"text\" name=\"numeroPasajeros\" value=\"").append(listaBuzon.get(0).getCantidadPasajeros()).append("\" readonly class=\"form-control\">\n" +
"							</div>	\n" +
"							<div class=\"col-sm-8 form-group\">\n" +
"								<label>Nombre de los Acompañantes: </label>\n" +
"								<input type=\"text\" name=\"nombrePasajeros\" value=\"").append(listaBuzon.get(0).getNombrePasajeros()).append("\" readonly class=\"form-control\">\n" +
"							</div>	\n" +
"						</div>\n" +
"                                                <div class=\"row\">	\n" +
"						<div class=\"form-group col-sm-12\">\n" +
"							<label>Observaciones: </label>\n" +
"							<input type=\"text\" name=\"observaciones\" value=\"").append(listaBuzon.get(0).getObservaciones()).append("\" readonly class=\"form-control\">\n" +
"						</div>	\n" +
"                                                </div>\n" +
"                                                                  \n" +
"                                        </div>\n" +
"                                    </div>");
    html.append("<div class=\"row\">\n" +
"                                                        <div class=\"col-md-5 col-sm-5 col-sm-offset-7 col-md-offset-8 col-lg-offset-9\">\n" +
"                                                            <a href='./solicitudes?code=6' class=\"btn btn-default\">Atrás</a>\n" +
"                                                            <a class=\"btn btn-danger\" role=\"button\" data-toggle=\"modal\" data-target=\"#confirmar\">Denegar<a>\n" +
"                                                            <a class=\"btn btn-success\" href=\"./Buzon?trace=tramitar&id=").append(numero).append("\">Tamitar</a>  \n" +
"                                                        </div>\n" +
"                                                    </div>");
    
    html.append("<div class=\"modal fade\" id=\"confirmar\">\n" +
"                                                   <div class=\"modal-dialog\">\n" +
"                                                       <div class=\"modal-content alert alert-warning\" role=\"alert\">\n" +
"                                                          <div class=\"modal-body\">\n" +
"                                                            <h4> ¿ Denegar la solicitud de transporte número : <i>").append(numero).append("</i> ? </h4> \n" +
"                                                           </div>\n" +
"                                                          <div class=\"modal-footer\">\n" +
"                                                               <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Cancelar</button>\n" +
"                                                               <a href='./Buzon?trace=denegar&id=").append(numero).append("' class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-ok\"></span> Confirmar</a>\n" +
"                                                          </div>\n" +
"                                                       </div>\n" +
"                                                    </div>\n" +
"                                                </div>");
    sentencia = null;
    c = null;
    return html.toString();
    }
}
