package Conexion;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PoolConexion {
    private static PoolConexion pool = null;
   private static DataSource ds = null;
   
   private PoolConexion() {
        try {
            InitialContext ic = new InitialContext();
            ds = (DataSource) ic.lookup("java:/comp/env/jdbc/sql2012");
        }
        catch(Exception error) {
           error.printStackTrace();
        }
   }
   
   public static PoolConexion getInstancia() {
       if (pool == null) {
           pool = new PoolConexion();
       }
       return pool;
   }
   
   public Connection getConexion() throws SQLException {
       try {
           return ds.getConnection();
       }
       catch (SQLException error) {
           throw error;
       }
   }
   
   public void cerrarConexion(Connection conexion) throws SQLException {
       try {
           conexion.close();
       }
       catch(SQLException error) {
           throw error;
       }
   }
}