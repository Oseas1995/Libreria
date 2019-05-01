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
public class Libro {
    private int idLibro;
    private String nombre;
    private int anioPublicacion;
    private int idCategoria;
    private int idIdioma;
    private float precioCosto;
    private float precioVenta;
    private int existencia;

    public Libro() {
    }

    public Libro(int idLibro, String nombre, int anioPublicacion, int idCategoria, int idIdioma, float precioCosto, float precioVenta, int existencia) {
        this.idLibro = idLibro;
        this.nombre = nombre;
        this.anioPublicacion = anioPublicacion;
        this.idCategoria = idCategoria;
        this.idIdioma = idIdioma;
        this.precioCosto = precioCosto;
        this.precioVenta = precioVenta;
        this.existencia = existencia;
    }

    /**
     * @return the idLibro
     */
    public int getIdLibro() {
        return idLibro;
    }

    /**
     * @param idLibro the idLibro to set
     */
    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the anioPublicacion
     */
    public int getAnioPublicacion() {
        return anioPublicacion;
    }

    /**
     * @param anioPublicacion the anioPublicacion to set
     */
    public void setAnioPublicacion(int anioPublicacion) {
        this.anioPublicacion = anioPublicacion;
    }

    /**
     * @return the idCategoria
     */
    public int getIdCategoria() {
        return idCategoria;
    }

    /**
     * @param idCategoria the idCategoria to set
     */
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    /**
     * @return the idIdioma
     */
    public int getIdIdioma() {
        return idIdioma;
    }

    /**
     * @param idIdioma the idIdioma to set
     */
    public void setIdIdioma(int idIdioma) {
        this.idIdioma = idIdioma;
    }

    /**
     * @return the precioCosto
     */
    public float getPrecioCosto() {
        return precioCosto;
    }

    /**
     * @param precioCosto the precioCosto to set
     */
    public void setPrecioCosto(float precioCosto) {
        this.precioCosto = precioCosto;
    }

    /**
     * @return the precioVenta
     */
    public float getPrecioVenta() {
        return precioVenta;
    }

    /**
     * @param precioVenta the precioVenta to set
     */
    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    /**
     * @return the existencia
     */
    public int getExistencia() {
        return existencia;
    }

    /**
     * @param existencia the existencia to set
     */
    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    @Override
    public String toString() {
        return "Informacion del Libro{\n" + "idLibro=" + idLibro + ", \nnombre=" + nombre + ", \nanioPublicacion=" + anioPublicacion + ", \nidCategoria=" + idCategoria + ", \nidIdioma=" + idIdioma + ", \nprecioCosto=" + precioCosto + ", \nprecioVenta=" + precioVenta + ", \nexistencia=" + existencia + '}';
    }
    
    
    
}
