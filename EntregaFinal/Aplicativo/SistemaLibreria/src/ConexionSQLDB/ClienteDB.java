/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.Cliente;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Oseas
 */
public class ClienteDB {
    public ArrayList<Cliente> ListCliente(){
    ArrayList<Cliente> cliente=new ArrayList();
    
    try{
        Connection cnx = DataBaseConnect.getConnection();
        Statement st = cnx.createStatement();
        ResultSet rs = st.executeQuery("select * from vw_Clientes");
        while (rs.next()) {
            Cliente cl=new Cliente();
            cl.setpNombre(rs.getString("pnombre"));
            cl.setsNombre(rs.getString("snombre"));
            cl.setpApellido(rs.getString("pApellido"));
            cl.setsApellido(rs.getString("sApellido"));
            cl.setDireccion(rs.getString("direccion"));
            cl.setCorreo(rs.getString("correo"));
            cl.setNoIdentidad(rs.getString("noIdentidad"));
            cliente.add(cl);
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        System.out.println("Error en el listado");
    }
    
    return cliente;
    }
    
    //Codigo para insertar datos
    public void insertarCliente(Cliente c){
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_CLIENTE(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, c.getpNombre());
            cs.setString(2, c.getsNombre());
            cs.setString(3, c.getpApellido());
            cs.setString(4, c.getsApellido());
            cs.setString(5, c.getDireccion());
            cs.setString(6, c.getCorreo());
            cs.setString(7, c.getNoIdentidad());
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
    public void EliminarRegistro(Cliente c){
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_CLIENTE(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, c.getpNombre());
            cs.setString(2, c.getsNombre());
            cs.setString(3, c.getpApellido());
            cs.setString(4, c.getsApellido());
            cs.setString(5, c.getDireccion());
            cs.setString(6, c.getCorreo());
            cs.setString(7, c.getNoIdentidad());
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
    
    
    
}
