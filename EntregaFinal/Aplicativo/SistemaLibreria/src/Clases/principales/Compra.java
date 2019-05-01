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
public class Compra {
    private int idLibro;
    private String nombreLibro;
    private int idProveedor;
    private int cantidad;
    private float precioVenta;
    private float precioCosto;
    private float total;

    public Compra() {
    }

    public Compra(int idLibro, String nombreLibro, int idProveedor, int cantidad, float precioVenta, float precioCosto, float total) {
        this.idLibro = idLibro;
        this.nombreLibro = nombreLibro;
        this.idProveedor = idProveedor;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
        this.precioCosto = precioCosto;
        this.total = total;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getNombreLibro() {
        return nombreLibro;
    }

    public void setNombreLibro(String nombreLibro) {
        this.nombreLibro = nombreLibro;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    public float getPrecioCosto() {
        return precioCosto;
    }

    public void setPrecioCosto(float precioCosto) {
        this.precioCosto = precioCosto;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
    
}
