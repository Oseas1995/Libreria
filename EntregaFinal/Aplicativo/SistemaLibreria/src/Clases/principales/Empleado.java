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
public class Empleado extends Persona {
    private int idEmpleado;

    public Empleado() {
     
    }

    public Empleado(int idEmpleado, int idPersona, String pNombre, String sNombre, String pApellido, String sApellido, String direccion, String correo, String noIdentidad) {
        super(idPersona, pNombre, sNombre, pApellido, sApellido, direccion, correo, noIdentidad);
        this.idEmpleado = idEmpleado;
    }

    /**
     * @return the idEmpleado
     */
    public int getIdEmpleado() {
        return idEmpleado;
    }

    /**
     * @param idEmpleado the idEmpleado to set
     */
    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    @Override
    public String toString() {
        return "Empleado{" + "idEmpleado=" + idEmpleado + '}';
    }
    
    
}
