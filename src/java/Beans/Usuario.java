package Beans;

public class Usuario {
    private String username = null;
    private String password = null;
    private boolean mod_Solicitudes_adm = false;
    private boolean mod_Solicitudes_user = true;
    private boolean mod_Vehiculos = false;
    private boolean mod_Conductores = false;
    private boolean mod_Combustible = false;
    private boolean mod_Usuarios_sist = false;
    private boolean mod_Consultas_Sist = false;
    private String database_role = null;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isMod_Solicitudes_adm() {
        return mod_Solicitudes_adm;
    }

    public void setMod_Solicitudes_adm(boolean mod_Solicitudes_adm) {
        this.mod_Solicitudes_adm = mod_Solicitudes_adm;
    }

    public boolean isMod_Solicitudes_user() {
        return mod_Solicitudes_user;
    }

    public void setMod_Solicitudes_user(boolean mod_Solicitudes_user) {
        this.mod_Solicitudes_user = mod_Solicitudes_user;
    }

    public boolean isMod_Vehiculos() {
        return mod_Vehiculos;
    }

    public void setMod_Vehiculos(boolean mod_Vehiculos) {
        this.mod_Vehiculos = mod_Vehiculos;
    }

    public boolean isMod_Conductores() {
        return mod_Conductores;
    }

    public void setMod_Conductores(boolean mod_Conductores) {
        this.mod_Conductores = mod_Conductores;
    }

    public boolean isMod_Combustible() {
        return mod_Combustible;
    }

    public void setMod_Combustible(boolean mod_Combustible) {
        this.mod_Combustible = mod_Combustible;
    }

    public boolean isMod_Usuarios_sist() {
        return mod_Usuarios_sist;
    }

    public void setMod_Usuarios_sist(boolean mod_Usuarios_sist) {
        this.mod_Usuarios_sist = mod_Usuarios_sist;
    }

    public boolean isMod_Consultas_Sist() {
        return mod_Consultas_Sist;
    }

    public void setMod_Consultas_Sist(boolean mod_Consultas_Sist) {
        this.mod_Consultas_Sist = mod_Consultas_Sist;
    }

    public String getDatabase_role() {
        return database_role;
    }

    public void setDatabase_role(String database_role) {
        this.database_role = database_role;
    }
    
    
}
