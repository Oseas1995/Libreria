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
public class Proveedor {
    private int idProveedor;
    private String direccion;
    private String correo;
    private String telefono;
    private String descripcion;
    private String nombre;
    private int idTipoProveedor;

    public Proveedor() {
    }

    public Proveedor(int idProveedor, String direccion, String correo, String telefono, String descripcion, String nombre, int idTipoProveedor) {
        this.idProveedor = idProveedor;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
        this.descripcion = descripcion;
        this.nombre = nombre;
        this.idTipoProveedor = idTipoProveedor;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdTipoProveedor() {
        return idTipoProveedor;
    }

    public void setIdTipoProveedor(int idTipoProveedor) {
        this.idTipoProveedor = idTipoProveedor;
    }
    
    
    
    
}
