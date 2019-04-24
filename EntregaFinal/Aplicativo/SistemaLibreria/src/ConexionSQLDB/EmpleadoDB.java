/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.Empleado;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Oseas
 */
public class EmpleadoDB {
    public ArrayList<Empleado> ListEmpleado(){
    ArrayList<Empleado> empleado=new ArrayList();
    
    try{
        Connection cnx = DataBaseConnect.getConnection();
        Statement st = cnx.createStatement();
        ResultSet rs = st.executeQuery("select * from vw_Empleados");
        while (rs.next()) {
            Empleado el=new Empleado();
            el.setpNombre(rs.getString("pnombre"));
            el.setsNombre(rs.getString("snombre"));
            el.setpApellido(rs.getString("pApellido"));
            el.setsApellido(rs.getString("sApellido"));
            el.setDireccion(rs.getString("direccion"));
            el.setCorreo(rs.getString("correo"));
            el.setNoIdentidad(rs.getString("noIdentidad"));
            empleado.add(el);
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        System.out.println("Error en el listado");
    }
    
    return empleado;
    }
    
    public void insertarEmpleado(Empleado e){
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_EMPLEADO(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, e.getpNombre());
            cs.setString(2, e.getsNombre());
            cs.setString(3, e.getpApellido());
            cs.setString(4, e.getsApellido());
            cs.setString(5, e.getDireccion());
            cs.setString(6, e.getCorreo());
            cs.setString(7, e.getNoIdentidad());
            cs.setString(8, "agregar");
            cs.registerOutParameter(9, java.sql.Types.INTEGER);
            cs.registerOutParameter(10, java.sql.Types.VARCHAR);
            
            cs.execute();
            
            int error = cs.getInt(9);
            String mensajeError = cs.getString(10);
            
            //System.out.println("error: " + error);
            //System.out.println("mensaje: " + mensajeError);
            if (error == 1){
                JOptionPane.showMessageDialog(null, mensajeError,"ERROR!!",JOptionPane.ERROR_MESSAGE);
            }else{
                JOptionPane.showMessageDialog(null, mensajeError);
            }
            
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error en el Insert");
        }
    }
    
    //Codigo para eliminar un registro
    public void EliminarRegistro(Empleado e){
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_CLIENTE(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, e.getpNombre());
            cs.setString(2, e.getsNombre());
            cs.setString(3, e.getpApellido());
            cs.setString(4, e.getsApellido());
            cs.setString(5, e.getDireccion());
            cs.setString(6, e.getCorreo());
            cs.setString(7, e.getNoIdentidad());
            cs.setString(8, "eliminar");
            cs.registerOutParameter(9, java.sql.Types.INTEGER);
            cs.registerOutParameter(10, java.sql.Types.VARCHAR);
            
            cs.execute();
            
            int error = cs.getInt(9);
            String mensajeError = cs.getString(10);
            
            //System.out.println("error: " + error);
            //System.out.println("mensaje: " + mensajeError);
            if (error == 1){
                JOptionPane.showMessageDialog(null, mensajeError,"ERROR!!",JOptionPane.ERROR_MESSAGE);
            }else{
                JOptionPane.showMessageDialog(null, mensajeError);
            }
            
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error al Eliminar el Registro");
        }
    }
    
    //Codigo para actualizar un registro
    public void ActualizarRegistro(Empleado e){
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_EMPLEADO(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, e.getpNombre());
            cs.setString(2, e.getsNombre());
            cs.setString(3, e.getpApellido());
            cs.setString(4, e.getsApellido());
            cs.setString(5, e.getDireccion());
            cs.setString(6, e.getCorreo());
            cs.setString(7, e.getNoIdentidad());
            cs.setString(8, "editar");
            cs.registerOutParameter(9, java.sql.Types.INTEGER);
            cs.registerOutParameter(10, java.sql.Types.VARCHAR);
            
            cs.execute();
            
            int error = cs.getInt(9);
            String mensajeError = cs.getString(10);
            
            //System.out.println("error: " + error);
            //System.out.println("mensaje: " + mensajeError);
            if (error == 1){
                JOptionPane.showMessageDialog(null, mensajeError,"ERROR!!",JOptionPane.ERROR_MESSAGE);
            }else{
                JOptionPane.showMessageDialog(null, mensajeError);
            }
            
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error al Actualizar el Registro");
        }
    }
    
}
