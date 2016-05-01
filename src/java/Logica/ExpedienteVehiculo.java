package Logica;
import Beans.Accesorios_Vehiculo;
import Beans.Factura_Gasolina;
import Beans.Vehiculo;
import Conexion.Consulta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ExpedienteVehiculo extends HttpServlet {
    String resultado ="";
    
    
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
            case "0": resultado="<div>Bienvenido al módulo de expedientes vehiculares!. Selecione una opción del menú a su izquierda para comenzar.</div>";request.setAttribute("trace","hello" ); break;
            case "1": resultado= getFormulario(); request.setAttribute("trace","form" ); break;
           // case "2": {request.setAttribute("lista", getUsuarios() ); break;}
            case "search":{ request.setAttribute("formulario",  getFormulario());request.setAttribute("trace","form" ); break; }
            case "succes":{ resultado= "Acción realizada con éxito!" ; break;}
            default:  resultado="Error! Acción no encontrada"; request.setAttribute("error", "Accion Inválida!");request.setAttribute("trace","invalido" ); break;
        }
        
        request.setAttribute("resultado", resultado);
        request.getRequestDispatcher("/Modulos/ExpedienteVehiculo.jsp").forward(request, response);
        
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
        String placa = request.getParameter("texto");
        request.setAttribute("vehiculo", BuscaPlaca(placa));
        request.setAttribute("accesorios", BuscaAccesorio(placa));
        request.setAttribute("facturas", BuscaFactura(placa));
        request.setAttribute("resultado", resultado);
        if(!resultado.equals("Encontrado")){ request.setAttribute("error", resultado);}
        request.setAttribute("trace","show" );
        
        
        request.getRequestDispatcher("/Modulos/ExpedienteVehiculo.jsp").forward(request, response);
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

    private String getFormulario()
    {
     StringBuilder html = new StringBuilder();
     
     html.append("<div class=\"row\">\n" +
"	<div class=\"col-md-5\">\n" +
"	<p class=\"parrafo-info\">Digite el número de placa que desea buscar :</p>\n" +
"	<form method=\"POST\" id='formLOGIN'>\n" +
"	<div class=\"input-group\">\n" +
"	<input type=\"text\" class=\"validate[required,maxSize[10]] form-control\" id=\"texto\" name=\"texto\" placeholder=\"Número de Placa:\" autocomplete=\"off\" maxlength='10'></input>\n" +
"	<span class=\"input-group-btn\">\n" +
"        <button class=\"btn btn-default\" type=\"button\">?</button>\n" +
"        <button class=\"btn btn-primary\" type=\"submit\">Buscar</button>\n" +
"      </span>\n" +
"       </div>\n" +
"	</form>	\n" +
"       </div>\n" +
"        </div>");
    
    return html.toString();
    }
    
    private ArrayList<Vehiculo> BuscaPlaca(String n)
    {
        Consulta c = new Consulta();
        String sentencia = "SELECT * FROM dbo.exp_naves where PLACA ='"+n+"'";
        c.ejecutarConsultas(sentencia,20);
        ArrayList<Vehiculo>  lista = c.getListaVehiculo();
        
        resultado = c.getResultado();
        return lista;
    }
     private ArrayList<Accesorios_Vehiculo> BuscaAccesorio(String n)
    {
        Consulta c = new Consulta();
        ArrayList<Accesorios_Vehiculo> listaAccesorios = new ArrayList<Accesorios_Vehiculo>();
        String sentencia2 = "SELECT * FROM dbo.accesorios where PLACA ='"+n+"'";
        
        c.ejecutarConsultas(sentencia2,21);
        listaAccesorios = c.getListaAccesorios();
        
        return listaAccesorios;
    }
     
    private ArrayList<Factura_Gasolina> BuscaFactura(String n)
    {
        Consulta c = new Consulta();
        ArrayList<Factura_Gasolina> listaFacturas = new ArrayList<Factura_Gasolina>();
        c.listarFacturasPlaca(n);
        listaFacturas = c.getListaGasolina();
        
        return listaFacturas;
    }
}
