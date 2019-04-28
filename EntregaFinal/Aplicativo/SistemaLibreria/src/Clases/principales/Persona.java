/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases.principales;

/**
 *
 * @author Oseas
 */
public class Persona {
    protected int idPersona;
    protected String pNombre;
    protected String sNombre;
    protected String pApellido;
    protected String sApellido;
    protected String direccion;
    protected String correo;
    protected String noIdentidad;
    
    public Persona(){}

    public Persona(int idPersona, String pNombre, String sNombre, String pApellido, String sApellido, String direccion, String correo, String noIdentidad) {
        this.idPersona = idPersona;
        this.pNombre = pNombre;
        this.sNombre = sNombre;
        this.pApellido = pApellido;
        this.sApellido = sApellido;
        this.direccion = direccion;
        this.correo = correo;
        this.noIdentidad = noIdentidad;
    }

    /**
     * @return the idPersona
     */
    public int getIdPersona() {
        return idPersona;
    }

    /**
     * @param idPersona the idPersona to set
     */
    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    /**
     * @return the pNombre
     */
    public String getpNombre() {
        return pNombre;
    }

    /**
     * @param pNombre the pNombre to set
     */
    public void setpNombre(String pNombre) {
        this.pNombre = pNombre;
    }

    /**
     * @return the sNombre
     */
    public String getsNombre() {
        return sNombre;
    }

    /**
     * @param sNombre the sNombre to set
     */
    public void setsNombre(String sNombre) {
        this.sNombre = sNombre;
    }

    /**
     * @return the pApellido
     */
    public String getpApellido() {
        return pApellido;
    }

    /**
     * @param pApellido the pApellido to set
     */
    public void setpApellido(String pApellido) {
        this.pApellido = pApellido;
    }

    /**
     * @return the sApellido
     */
    public String getsApellido() {
        return sApellido;
    }

    /**
     * @param sApellido the sApellido to set
     */
    public void setsApellido(String sApellido) {
        this.sApellido = sApellido;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the noIdentidad
     */
    public String getNoIdentidad() {
        return noIdentidad;
    }

    /**
     * @param noIdentidad the noIdentidad to set
     */
    public void setNoIdentidad(String noIdentidad) {
        this.noIdentidad = noIdentidad;
    }

    @Override
    public String toString() {
        return "Persona{" + "idPersona=" + idPersona + ", pNombre=" + pNombre + ", sNombre=" + sNombre + ", pApellido=" + pApellido + ", sApellido=" + sApellido + ", direccion=" + direccion + ", correo=" + correo + ", noIdentidad=" + noIdentidad + '}';
    }
    
    
}
