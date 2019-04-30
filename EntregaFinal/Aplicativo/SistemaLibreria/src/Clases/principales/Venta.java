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
public class Venta {
    private int idLibro;
    private String nombreLibro;
    private int idCliente;
    private int idTipoObtencion;
    private int idTipoPago;
    private int cantidad;
    private float precio;
    private float total;

    public Venta() {
    }

    public Venta(int idLibro, String nombreLibro, int idCliente, int idTipoObtencion, int idTipoPago, int cantidad, float precio, float total) {
        this.idLibro = idLibro;
        this.nombreLibro = nombreLibro;
        this.idCliente = idCliente;
        this.idTipoObtencion = idTipoObtencion;
        this.idTipoPago = idTipoPago;
        this.cantidad = cantidad;
        this.precio = precio;
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

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdTipoObtencion() {
        return idTipoObtencion;
    }

    public void setIdTipoObtencion(int idTipoObtencion) {
        this.idTipoObtencion = idTipoObtencion;
    }

    public int getIdTipoPago() {
        return idTipoPago;
    }

    public void setIdTipoPago(int idTipoPago) {
        this.idTipoPago = idTipoPago;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
