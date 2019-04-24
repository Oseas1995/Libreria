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
public class Cliente extends Persona {
    private int idCliente;
    //fecha

    public Cliente(int idCliente, int idPersona, String pNombre, String sNombre, String pApellido, String sApellido, String direccion, String correo, String noIdentidad) {
        super(idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, noIdentidad);
        this.idCliente = idCliente;
    }

    public Cliente(){
        
    }
    
    
    /**
     * @return the idCliente
     */
    public int getIdCliente() {
        return idCliente;
    }

    /**
     * @param idCliente the idCliente to set
     */
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + '}';
    }
    
    
}
