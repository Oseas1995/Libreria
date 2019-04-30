/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.TipoObtencion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Oseas
 */
public class TipoObtencionDB {
    public ArrayList<TipoObtencion> ListTipoObtencion(){
    ArrayList<TipoObtencion> tipoOb=new ArrayList();
    
    try{
        Connection cnx = DataBaseConnect.getConnection();
        Statement st = cnx.createStatement();
        ResultSet rs = st.executeQuery("select * from TipoObtencion");
        while (rs.next()) {
            TipoObtencion cl=new TipoObtencion();
            cl.setId(rs.getInt("idTipoObtencion"));
            cl.setDescripcion(rs.getString("descripcion"));
            tipoOb.add(cl);
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        System.out.println("Error en el listado");
    }
    
    return tipoOb;
    }
    
    //para buscar datos pero por descripcion
    public TipoObtencion getTipoObtencion(String des) {
        TipoObtencion cl = null;
        try {
            Connection cnx = DataBaseConnect.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery("SELECT idTipoObtencion "
                    + "   FROM TipoObtencion WHERE descripcion='" + des + "'");
            while (rs.next()) {
                cl = new TipoObtencion();
                cl.setId(rs.getInt("idTipoObtencion"));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error en buscar");
        }
        return cl;
    }
}
