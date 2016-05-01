package Beans;import java.sql.Date;

public class Conductor {
    String ced;
    String nom;
    String ap1;
    String ap2;
    String numtel;
    String rutaFoto;
    String rutaLicencia;
    String rutaEstadoLicencia;
    Date vencimientoLicencia;
    Date vencimientoEstadoLicencia;

    public Conductor(String ced, String nom, String ap1, String ap2, String numtel, String rutaFoto, String rutaLicencia, String rutaEstadoLicencia, Date vencimientoLicencia, Date vencimientoEstadoLicencia) {
        this.ced = ced;
        this.nom = nom;
        this.ap1 = ap1;
        this.ap2 = ap2;
        this.numtel = numtel;
        this.rutaFoto = rutaFoto;
        this.rutaLicencia = rutaLicencia;
        this.rutaEstadoLicencia = rutaEstadoLicencia;
        this.vencimientoLicencia = vencimientoLicencia;
        this.vencimientoEstadoLicencia = vencimientoEstadoLicencia;
    }

    public String getCed() {
        return ced;
    }

    public void setCed(String ced) {
        this.ced = ced;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAp1() {
        return ap1;
    }

    public void setAp1(String ap1) {
        this.ap1 = ap1;
    }

    public String getAp2() {
        return ap2;
    }

    public void setAp2(String ap2) {
        this.ap2 = ap2;
    }

    public String getNumtel() {
        return numtel;
    }

    public void setNumtel(String numtel) {
        this.numtel = numtel;
    }

    public String getRutaFoto() {
        return rutaFoto;
    }

    public void setRutaFoto(String rutaFoto) {
        this.rutaFoto = rutaFoto;
    }

    public String getRutaLicencia() {
        return rutaLicencia;
    }

    public void setRutaLicencia(String rutaLicencia) {
        this.rutaLicencia = rutaLicencia;
    }

    public String getRutaEstadoLicencia() {
        return rutaEstadoLicencia;
    }

    public void setRutaEstadoLicencia(String rutaEstadoLicencia) {
        this.rutaEstadoLicencia = rutaEstadoLicencia;
    }

    public Date getVencimientoLicencia() {
        return vencimientoLicencia;
    }

    public void setVencimientoLicencia(Date vencimientoLicencia) {
        this.vencimientoLicencia = vencimientoLicencia;
    }

    public Date getVencimientoEstadoLicencia() {
        return vencimientoEstadoLicencia;
    }

    public void setVencimientoEstadoLicencia(Date vencimientoEstadoLicencia) {
        this.vencimientoEstadoLicencia = vencimientoEstadoLicencia;
    }

    @Override
    public String toString() {
        return "Conductor{" + "ced=" + ced + ", nom=" + nom + ", ap1=" + ap1 + ", ap2=" + ap2 + ", numtel=" + numtel + ", rutaFoto=" + rutaFoto + ", rutaLicencia=" + rutaLicencia + ", rutaEstadoLicencia=" + rutaEstadoLicencia + ", vencimientoLicencia=" + vencimientoLicencia + ", vencimientoEstadoLicencia=" + vencimientoEstadoLicencia + '}';
    }
    
    
   
    
}
