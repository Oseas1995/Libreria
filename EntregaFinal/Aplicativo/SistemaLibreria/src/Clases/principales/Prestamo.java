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
public class Prestamo {
    private int idLibro;
    private int idCliente;
    private int idTipoObtencion;
    private int cantidadDias;
    private int idTipoPago;
    private String nombreLibro;
    private String fechaInicio;
    private String fechaMax;

    public Prestamo() {
    }

    public Prestamo(int idLibro, int idCliente, int idTipoObtencion, int cantidadDias, int idTipoPago) {
        this.idLibro = idLibro;
        this.idCliente = idCliente;
        this.idTipoObtencion = idTipoObtencion;
        this.cantidadDias = cantidadDias;
        this.idTipoPago = idTipoPago;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
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

    public int getCantidadDias() {
        return cantidadDias;
    }

    public void setCantidadDias(int cantidadDias) {
        this.cantidadDias = cantidadDias;
    }

    public int getIdTipoPago() {
        return idTipoPago;
    }

    public void setIdTipoPago(int idTipoPago) {
        this.idTipoPago = idTipoPago;
    }

    public String getNombreLibro() {
        return nombreLibro;
    }
    
    public void setNombreLibro(String nombreLibro) {
        this.nombreLibro = nombreLibro;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaMax() {
        return fechaMax;
    }

    public void setFechaMax(String fechaMax) {
        this.fechaMax = fechaMax;
    }
    
    
    
}
