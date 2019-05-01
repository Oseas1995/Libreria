/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.Proveedor;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Oseas
 */
public class ProveedorDB {
    public ArrayList<Proveedor> ListProveedor(){
    ArrayList<Proveedor> prov=new ArrayList();
    
    try{
        Connection cnx = DataBaseConnect.getConnection();
        Statement st = cnx.createStatement();
        ResultSet rs = st.executeQuery("select * from Proveedor");
        while (rs.next()) {
            Proveedor cl=new Proveedor();
            cl.setIdProveedor(rs.getInt("idProveedor"));
            cl.setDireccion(rs.getString("direccion"));
            cl.setCorreo(rs.getString("correo"));
            cl.setTelefono(rs.getString("telefono"));
            cl.setDescripcion(rs.getString("descripcion"));
            cl.setNombre(rs.getString("nombre"));
            cl.setIdTipoProveedor(rs.getInt("TipoProveedor_idTipoProveedor"));
            prov.add(cl);
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        System.out.println("Error en el listado");
    }
    
    return prov;
    }
    
    //para buscar datos pero por nombre
    public Proveedor getProveedor(String nom) {
        Proveedor cl = null;
        try {
            Connection cnx = DataBaseConnect.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery("SELECT idProveedor "
                    + "   FROM Proveedor WHERE nombre='" + nom + "'");
            while (rs.next()) {
                cl = new Proveedor();
                cl.setIdProveedor(rs.getInt("idProveedor"));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error en buscar");
        }
        return cl;
    }
    
}
