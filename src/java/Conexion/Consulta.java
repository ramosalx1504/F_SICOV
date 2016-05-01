package Conexion;
import Beans.Accesorios_Vehiculo;
import Beans.Conductor;
import Beans.Factura_Gasolina;
import Beans.Solicitud;
import Beans.Solicitud_Transporte;
import Beans.Solicitudes_Entrantes;
import Beans.Usuario;
import Beans.Vehiculo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Consulta {
    
     String resultado = "";
     ResultSet rs = null;
     Usuario userDB = new Usuario();
     ArrayList<Usuario> lista = new ArrayList<Usuario>();
     ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
     ArrayList<Solicitud_Transporte> listaDeneg = new ArrayList<Solicitud_Transporte>();
     ArrayList<Solicitudes_Entrantes> listaBuzon = new ArrayList<Solicitudes_Entrantes>();
     ArrayList<Vehiculo> listaVehiculo = new ArrayList<Vehiculo>();
     ArrayList<Accesorios_Vehiculo> listaAccesorios = new ArrayList<Accesorios_Vehiculo>();
     ArrayList<Factura_Gasolina> listaFacturas = new ArrayList<>();

    public ArrayList<Usuario> getListau() {
        return lista;
    }

    public void setLista(ArrayList<Usuario> lista) {
        this.lista = lista;
    }
    
    public String getResultado() {
        return resultado;
    }
    public Usuario getUserDB() {
        return userDB;
    }

    public ArrayList<Solicitud> getListaSol() {
        return listaSol;
    }

    public void setListaSol(ArrayList<Solicitud> listaSol) {
        this.listaSol = listaSol;
    }
    
    public ArrayList<Solicitud_Transporte> getListaDeneg() {
        return listaDeneg;
    }

    public ArrayList<Solicitudes_Entrantes> getListaBuzon() {
        return listaBuzon;
    }

    public ArrayList<Vehiculo> getListaVehiculo() {
        return listaVehiculo;
    }

    public ArrayList<Accesorios_Vehiculo> getListaAccesorios() {
        return listaAccesorios;
    }

    public ArrayList<Factura_Gasolina> getListaGasolina() {
        return listaFacturas;
    }
    
    
    
    public void ejecutarConsultas(String sentencia , int n){
      
        try {
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            
            if (sentencia.substring(0,6).equalsIgnoreCase("select")) {
                rs= query.executeQuery();
                Switch(n); 
            }
            else {
                int i = query.executeUpdate();
                if (i == 0) {
                    resultado = "La sentencia fue ejecutada satisfactoriamente";
                }
                else {
                    resultado = "La sentencia fue ejecutada satisfactoriamente.</br>"
                            + i + " registro(s) afectados";
                }
                Switch(n);
            }
           query.close();
           conexion.close();
        }
        catch(Exception error) {
            resultado = "Error con la ejecucion de la sentencia SQL: <br />"
                    + error.getMessage();
        }
    }
    private void Switch(int n)
    {
        switch(n)
        {
           
            case 1 :{try{resultado = getUsuario(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 2 :{try{ lista=ListaUsuarios(rs);}catch(Exception e){resultado=e.getMessage();}break;}
            case 3 :{try{ lista=ListaUsuariosEspecifico(rs);}catch(Exception e){resultado=e.getMessage();}break;}
            case 4 :{try{ listaSol = ListarSolicitudes(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 5 :{try{ listaDeneg = SolicitudesDenegadas(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 6 :{try{ listaBuzon = BuzonSolicitudes(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 20 :{try{ listaVehiculo = BuscaPorPlaca(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 21 :{try{ listaAccesorios = BuscarAccesorios(rs);}catch(Exception e){resultado=e.getMessage();} break;}
            case 10:{break;}
        }
    }
    private String getUsuario(ResultSet rs)throws SQLException{
    rs.next();
    resultado = "Encontrado";
    userDB.setUsername(rs.getString(1));
    userDB.setPassword(rs.getString(2));
    if(rs.getString(3).equals("1")){userDB.setMod_Solicitudes_adm(true);}
    if(rs.getString(4).equals("1")){userDB.setMod_Solicitudes_user(true);}
    if(rs.getString(5).equals("1")){userDB.setMod_Vehiculos(true);}
    if(rs.getString(6).equals("1")){userDB.setMod_Conductores(true);}
    if(rs.getString(7).equals("1")){userDB.setMod_Combustible(true);}
    if(rs.getString(8).equals("1")){userDB.setMod_Usuarios_sist(true);}
    if(rs.getString(9).equals("1")){userDB.setMod_Consultas_Sist(true);}
    userDB.setDatabase_role(rs.getString(10));
    return resultado;
    }
    
   private  ArrayList<Usuario> ListaUsuarios(ResultSet rs) throws SQLException
    {
        Usuario u = new Usuario();
       ArrayList<Usuario> listauser = new ArrayList<Usuario>();
      
        while(rs.next()){
            u = new Usuario();
            u.setUsername(rs.getString(1));
            if("1".equals(rs.getString(3))){u.setMod_Solicitudes_adm(true);}
            if("1".equals(rs.getString(4))){u.setMod_Solicitudes_user(true);}
            if("1".equals(rs.getString(5))){u.setMod_Vehiculos(true);}
            if("1".equals(rs.getString(6))){u.setMod_Conductores(true);}
            if("1".equals(rs.getString(7))){u.setMod_Combustible(true);}
            if("1".equals(rs.getString(8))){u.setMod_Usuarios_sist(true);}
            if("1".equals(rs.getString(9))){u.setMod_Consultas_Sist(true);}
            u.setDatabase_role(rs.getString(10));
            listauser.add(u);
        }
        return listauser;
    }
   
   private  ArrayList<Usuario> ListaUsuariosEspecifico(ResultSet rs) throws SQLException
    {
       Usuario u = new Usuario();
       ArrayList<Usuario> listauser = new ArrayList<Usuario>();
       resultado = "Usuario no encontrado!   *Recuerde que puede utilizar la opción para ver todos los usuarios a su izquierda!";
        while(rs.next()){
            resultado = "Encontrado";
            u = new Usuario();
            u.setUsername(rs.getString(1));
            if("1".equals(rs.getString(3))){u.setMod_Solicitudes_adm(true);}
            if("1".equals(rs.getString(4))){u.setMod_Solicitudes_user(true);}
            if("1".equals(rs.getString(5))){u.setMod_Vehiculos(true);}
            if("1".equals(rs.getString(6))){u.setMod_Conductores(true);}
            if("1".equals(rs.getString(7))){u.setMod_Combustible(true);}
            if("1".equals(rs.getString(8))){u.setMod_Usuarios_sist(true);}
            if("1".equals(rs.getString(9))){u.setMod_Consultas_Sist(true);}
            u.setDatabase_role(rs.getString(10));
            listauser.add(u);
        }
        return listauser;
    }
   
   public boolean existeChofer(String ced) {
        boolean flag = false;
        try {

            String sentencia = "select * from dbo.conductores where Cedula ='" + ced + "'";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            ResultSet rs = query.executeQuery();

            flag = rs.next();
            conexion.close();;
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }

    public void ingresaChofer(String Cedula, String Nombre, String ap1, String ap2, String telefono, String fotografia,
            String licencia, String licenciaEmpres, Date licenciavencimiento, Date licenciaEmpresvencimiento) {
        try {
            String sentencia = "INSERT INTO dbo.conductores(Cedula, Nombre, ap1, ap2, telefono, "
                    + "fotografia, licencia, licenciaEmpres, licenciavencimiento, licenciaEmpresvencimiento) "
                    + "VALUES('" + Cedula + "', '" + Nombre + "', '" + ap1 + "', '" + ap2
                    + "', '" + telefono + "', '" + fotografia + "', '" + licencia + "', '" + licenciaEmpres + "', '"
                    + licenciavencimiento + "', '" + licenciaEmpresvencimiento + "')";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            System.out.println(sentencia);
            query.execute();
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Conductor> Listaconductores() {
        ArrayList<Conductor> Lista = new ArrayList<>();
        try {

            String sentencia = "select * from dbo.conductores ";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                String ced = rs.getString("Cedula");
                String nom = rs.getString("Nombre");
                String ap1 = rs.getString("ap1");
                String ap2 = rs.getString("ap2");
                String numtel = rs.getString("telefono");
                String rutaFoto = rs.getString("fotografia");
                String rutaLicencia = rs.getString("licencia");
                String rutaEstadoLicencia = rs.getString("licenciaEmpres");
                Date vencimientoLicencia = rs.getDate("licenciavencimiento");
                Date vencimientoEstadoLicencia = rs.getDate("licenciaEmpresvencimiento");
                Conductor cond = new Conductor(ced, nom, ap1, ap2, numtel, rutaFoto, rutaLicencia, rutaEstadoLicencia,
                vencimientoLicencia, vencimientoEstadoLicencia);
                Lista.add(cond);
            }
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Lista;
    }
    
    public void ActualizarChofer(String Cedula, String Nombre, String ap1, String ap2, String telefono, String fotografia,
            String licencia, String licenciaEmpres, Date licenciavencimiento, Date licenciaEmpresvencimiento) {
        try {
            String sentencia = "UPDATE dbo.conductores SET Cedula ='"+ Cedula+ "', Nombre ='" + Nombre + "',"
                    + "ap1 ='" + ap1 + "', ap2='" + ap2 + "',telefono='" +  telefono + "', fotografia ='" + fotografia
                    +"', licencia ='" + licencia + "', licenciaEmpres ='" + licenciaEmpres + "', licenciavencimiento='" 
                    + licenciavencimiento + "', licenciaEmpresvencimiento='" + licenciaEmpresvencimiento + "'WHERE Cedula = '" +
                    Cedula + "';";
                    System.out.println(sentencia);
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            System.out.println(sentencia);
            query.execute();
            conexion.close();;
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
    public void ingresaVehiculo(String Cedula, String Nombre, String ap1, String ap2, String telefono, String fotografia,
            String licencia, String licenciaEmpres, Date licenciavencimiento, Date licenciaEmpresvencimiento) {
        try {
            String sentencia = "INSERT INTO dbo.conductores(Cedula, Nombre, ap1, ap2, telefono, "
                    + "fotografia, licencia, licenciaEmpres, licenciavencimiento, licenciaEmpresvencimiento) "
                    + "VALUES('" + Cedula + "', '" + Nombre + "', '" + ap1 + "', '" + ap2
                    + "', '" + telefono + "', '" + fotografia + "', '" + licencia + "', '" + licenciaEmpres + "', '"
                    + licenciavencimiento + "', '" + licenciaEmpresvencimiento + "')";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            System.out.println(sentencia);
            query.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
    public static ArrayList<Solicitud> ListarSolicitudes(ResultSet rs) throws SQLException
{
    Solicitud s = new Solicitud();
    ArrayList<Solicitud> listaSol = new ArrayList<Solicitud>();
    while(rs.next())
    {
        s = new Solicitud();
        s.setNumeroSolicitud(Integer.parseInt(rs.getString(1)));
        s.setFechaSalida(rs.getString(2));
        s.setDepartamento(rs.getString(11));
        listaSol.add(s);
    }
    return listaSol;
}
    public String GenerarScripttCompleto(ArrayList<Conductor> conductores) {
        StringBuilder salida = new StringBuilder();

        salida.append("<script>");
        salida.append("var conductor = [];\n");
        salida.append("conductor.shift();");
        for(int i = 0; i < conductores.size(); i++ ){
        salida.append("conductor.push(\""+ conductores.get(i).getCed() +"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getNom()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getAp1()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getAp2() +"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getNumtel()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaEstadoLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaFoto()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getVencimientoEstadoLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getVencimientoLicencia()+"\");\n");
        }
        salida.append("function num(){\n");
        salida.append("var form = document.getElementById('conductor');\n");
        salida.append("var indiceSeleccionado = form.selectedIndex;\n");
        salida.append("document.getElementById('nombree').value =  conductor[indiceSeleccionado*10+1];\n");
        salida.append("document.getElementById('primerApellidoo').value =  conductor[indiceSeleccionado*10+2];\n");
        salida.append("document.getElementById('segundoApellidoo').value =  conductor[indiceSeleccionado*10+3];\n");
        salida.append("document.getElementById('telefonoo').value =  conductor[indiceSeleccionado*10+4];\n");
        //salida.append("document.getElementById('FotografiaCond').value =  conductor[indiceSeleccionado*10+6];\n");
       // salida.append("document.getElementById('segundoApellidoo').value =  conductor[indiceSeleccionado*10+3];\n");
        //salida.append("document.getElementById('segundoApellidoo').value =  conductor[indiceSeleccionado*10+3];\n");
        //salida.append("document.getElementById('segundoApellidoo').value =  conductor[indiceSeleccionado*10+3];\n");
        salida.append("document.getElementById('permicond').value =  conductor[indiceSeleccionado*10+8];\n");
        salida.append("document.getElementById('datevenc').value =  conductor[indiceSeleccionado*10+9];\n");
        salida.append("}\n");
        salida.append("</script>\n");
        return salida.toString();
    }
    public String GenerarScripttCompleto1(ArrayList<Conductor> conductores) {
        StringBuilder salida = new StringBuilder();

        salida.append("<script>");
        salida.append("var conductor = [];\n");
        salida.append("conductor.shift();");
        for(int i = 0; i < conductores.size(); i++ ){
        salida.append("conductor.push(\""+ conductores.get(i).getCed() +"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getNom()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getAp1()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getAp2() +"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getNumtel()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaEstadoLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaFoto()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getRutaLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getVencimientoEstadoLicencia()+"\");");
        salida.append("conductor.push(\""+ conductores.get(i).getVencimientoLicencia()+"\");\n");
        }
        salida.append("function num1(){\n");
        //salida.append("alert('hola');\n");
        salida.append("var form = document.getElementById('conductor');\n");
        salida.append("var indiceSeleccionado = form.selectedIndex;\n");
        salida.append("document.getElementById('nombree').innerHTML  =  conductor[indiceSeleccionado*10+1];\n");
        salida.append("document.getElementById('primerApellidoo').innerHTML  =  conductor[indiceSeleccionado*10+2];\n");
        salida.append("document.getElementById('segundoApellidoo').innerHTML  =  conductor[indiceSeleccionado*10+3];\n");
        salida.append("document.getElementById('telefonoo').innerHTML  =  conductor[indiceSeleccionado*10+4];\n");
        salida.append("document.getElementById('FotografiaCond').setAttribute('src', \"../imagen/\"+conductor[indiceSeleccionado*10+6]);\n");
        salida.append("document.getElementById('licenCond').setAttribute('src', \"../imagen/\"+conductor[indiceSeleccionado*10+7]);\n");
        salida.append("document.getElementById('permcondfile').setAttribute('src', \"../imagen/\"+conductor[indiceSeleccionado*10+5]);\n");
        salida.append("document.getElementById('permicond').innerHTML  =  conductor[indiceSeleccionado*10+8];\n");
        salida.append("document.getElementById('datevenc').innerHTML  =  conductor[indiceSeleccionado*10+9];\n");
        salida.append("}\n");
        salida.append("</script>\n");
        return salida.toString();
        //salida.append("document.getElementById('FotografiaCond').innerHTML =  conductor[indiceSeleccionado*10+6];\n");
       //salida.append("document.getElementById('licenCond').innerHTML =  conductor[indiceSeleccionado*10+7];\n");
        //salida.append("document.getElementById('permcondfile').innerHTML =  <img width=\"100\"  src='../imagen/conductor[indiceSeleccionado*10+5]'/>;\n");
    }
    
    public String Generarconsulta() {
        StringBuilder salida = new StringBuilder();
        salida.append("num()");
        return salida.toString();
    }
    
    public static ArrayList<Solicitud_Transporte> SolicitudesDenegadas(ResultSet rs) throws SQLException
{
    Solicitud_Transporte x = new Solicitud_Transporte();
    ArrayList<Solicitud_Transporte> listaDeneg = new ArrayList<Solicitud_Transporte>();
    while(rs.next())
    {
        x = new Solicitud_Transporte();
        x.setUser1(rs.getString(10));
        x.setFechaSalida(rs.getString(1));
        x.setDepartamento(rs.getString(7));
        listaDeneg.add(x);
    }
    return listaDeneg;
}


public static ArrayList<Solicitudes_Entrantes> BuzonSolicitudes(ResultSet rs) throws SQLException
{
    Solicitudes_Entrantes se = new Solicitudes_Entrantes();
    ArrayList<Solicitudes_Entrantes> listaBuzon = new ArrayList<Solicitudes_Entrantes>();
    while(rs.next())
    {
        se = new Solicitudes_Entrantes();
        se.setNumero(rs.getString("NUMERO"));
        se.setUsuario(rs.getString(2));
        se.setFechaRecibido(rs.getString(3));
        se.setEncargado(rs.getString(4));
        se.setFechaSalida(rs.getString(6));
        se.setFechaRegreso(rs.getString(7));
        se.setEmailEncargado(rs.getString(5));
        se.setHoraSalida(rs.getString(8));
        se.setHoraRegreso(rs.getString(9));
        se.setDuracionEstimada(rs.getString(10));
        se.setDestino(rs.getString(11));
        se.setDepartamento(rs.getString(12));
        se.setExtensionEncargado(rs.getString(13));
        se.setCantidadPasajeros(rs.getString(14));
        se.setNombrePasajeros(rs.getString(15));
        se.setObservaciones(rs.getString(16));
        listaBuzon.add(se);
    }
    return listaBuzon;
}

public ArrayList<Vehiculo> ListarPlacas() {
        ArrayList<Vehiculo> Lista = new ArrayList<>();
        try {

            String sentencia = "select * from dbo.exp_naves";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            ResultSet rss = query.executeQuery();
            while (rss.next()) {
                Vehiculo v = new Vehiculo();
                v.setPlaca(rss.getString("PLACA"));
                
                Lista.add(v);
            }
            query.close();
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Lista;
    }
private  ArrayList<Vehiculo> BuscaPorPlaca(ResultSet rs) throws SQLException
    {
       Vehiculo v = new Vehiculo();
       ArrayList<Vehiculo> listaVehiculo = new ArrayList<Vehiculo>();
       resultado = "Vehículo no encontrado!";
        while(rs.next()){
            resultado = "Encontrado";
            v = new Vehiculo();
            v.setPlaca(rs.getString("PLACA"));
            v.setChasis(rs.getString("CHASIS"));
            v.setMotor(rs.getString("MOTOR"));
            v.setTomo(rs.getShort("TOMO"));
            v.setFolio(rs.getShort("FOLIO"));
            v.setAsiento(rs.getShort("ASIENTO"));
            v.setFechaInscripcion(rs.getString("FECHA_INSCRIPCION"));
            v.setMarca(rs.getString("COD_MARCA"));
            v.setModelo(rs.getString("COD_MODELO"));
            v.setEstilo(rs.getString("COD_ESTILO"));
            v.setColor(rs.getString("COD_COLOR"));
            
            v.setCilindrada(rs.getShort("CILINDRADA"));
            
            
            listaVehiculo.add(v);
        }
        return listaVehiculo;
    }

private  ArrayList<Accesorios_Vehiculo> BuscarAccesorios(ResultSet rs) throws SQLException
    {
       Accesorios_Vehiculo ac = new Accesorios_Vehiculo();
       ArrayList<Accesorios_Vehiculo> listaAccesorios = new ArrayList<Accesorios_Vehiculo>();
       
        while(rs.next()){
            
            ac.setDescrip(rs.getString("DESCRIPCION"));
            ac.setNombreAccesorio(rs.getString("NACCESORIO"));
            listaAccesorios.add(ac);
  
        }
        return listaAccesorios ;
    }
public void ingresaFactura(String sentencia) {
        try {
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            System.out.println(sentencia);
            query.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public ArrayList<Factura_Gasolina> listarFacturas(){
         ArrayList<Factura_Gasolina> Lista = new ArrayList<>();
        try {

            String sentencia = "select * from dbo.facturas_combustible";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            ResultSet rs = query.executeQuery();
            while (rs.next()){
                String USUARIO = rs.getString("USUARIO");
                Date FECHA_RECIBIDO = rs.getDate("FECHA_RECIBIDO");
                String PLACA = rs.getString("PLACA");
                String TIPO_PAGO = rs.getString("TIPO_PAGO");
                String NUMERO_TARJETA = rs.getString("NUMERO_TARJETA");
                String NUMERO_FACTURA = rs.getString("NUMERO_FACTURA");
                String MONTO_COMPRA = rs.getString("MONTO_COMPRA");
                String CEDULA_ESTACION = rs.getString("CEDULA_ESTACION");
                String NOMBRE_ESTACION = rs.getString("NOMBRE_ESTACION");
                String KILOMETRAJE = rs.getString("KILOMETRAJE");
                String LITROS = rs.getString("LITROS");
                Factura_Gasolina fac = new Factura_Gasolina();
                fac.setUsuario(USUARIO);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                fac.setFechaRecibido(sdf.format(FECHA_RECIBIDO));
                fac.setPlacaVehiculo(PLACA);
                fac.setNumeroFacturaCombustible(NUMERO_FACTURA);
                fac.setMontoCompraCombustible(MONTO_COMPRA);
                fac.setCedulaEstacion(CEDULA_ESTACION);
                fac.setNombreEstacion(NOMBRE_ESTACION);
                fac.setKilometraje(KILOMETRAJE);
                fac.setLitros(LITROS);
                fac.setFormaPago(TIPO_PAGO);
                fac.setNumeroTarjeta(NUMERO_TARJETA);
                Lista.add(fac);
            }
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Lista;
    }
    public void listarFacturasPlaca(String placa){
         
        try {

            String sentencia = "select * from dbo.facturas_combustible where PLACA='"+placa+"'";
            PoolConexion pool = PoolConexion.getInstancia();
            Connection conexion = pool.getConexion();
            PreparedStatement query = conexion.prepareStatement(sentencia);
            ResultSet rs = query.executeQuery();
            while (rs.next()){
                String USUARIO = rs.getString("USUARIO");
                Date FECHA_RECIBIDO = rs.getDate("FECHA_RECIBIDO");
                String PLACA = rs.getString("PLACA");
                String TIPO_PAGO = rs.getString("TIPO_PAGO");
                String NUMERO_TARJETA = rs.getString("NUMERO_TARJETA");
                String NUMERO_FACTURA = rs.getString("NUMERO_FACTURA");
                String MONTO_COMPRA = rs.getString("MONTO_COMPRA");
                String CEDULA_ESTACION = rs.getString("CEDULA_ESTACION");
                String NOMBRE_ESTACION = rs.getString("NOMBRE_ESTACION");
                String KILOMETRAJE = rs.getString("KILOMETRAJE");
                String LITROS = rs.getString("LITROS");
                Factura_Gasolina fac = new Factura_Gasolina();
                fac.setUsuario(USUARIO);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                fac.setFechaRecibido(sdf.format(FECHA_RECIBIDO));
                fac.setPlacaVehiculo(PLACA);
                fac.setNumeroFacturaCombustible(NUMERO_FACTURA);
                fac.setMontoCompraCombustible(MONTO_COMPRA);
                fac.setCedulaEstacion(CEDULA_ESTACION);
                fac.setNombreEstacion(NOMBRE_ESTACION);
                fac.setKilometraje(KILOMETRAJE);
                fac.setLitros(LITROS);
                fac.setFormaPago(TIPO_PAGO);
                fac.setNumeroTarjeta(NUMERO_TARJETA);
                listaFacturas.add(fac);
            }
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}