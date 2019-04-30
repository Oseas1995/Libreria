/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.TipoPago;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Oseas
 */
public class TipoPagoDB {
    public ArrayList<TipoPago> ListTipoPago(){
    ArrayList<TipoPago> tipoPago=new ArrayList();
    
    try{
        Connection cnx = DataBaseConnect.getConnection();
        Statement st = cnx.createStatement();
        ResultSet rs = st.executeQuery("select * from TipoPago");
        while (rs.next()) {
            TipoPago cl=new TipoPago();
            cl.setId(rs.getInt("idTipoPago"));
            cl.setDescripcion(rs.getString("descripcion"));
            tipoPago.add(cl);
        }
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        System.out.println("Error en el listado");
    }
    
    return tipoPago;
    }
    
    //para buscar datos pero por descripcion
    public TipoPago getTipoPago(String des) {
        TipoPago cl = null;
        try {
            Connection cnx = DataBaseConnect.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery("SELECT idTipoPago "
                    + "   FROM TipoPago WHERE descripcion='" + des + "'");
            while (rs.next()) {
                cl = new TipoPago();
                cl.setId(rs.getInt("idTipoPago"));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error en buscar");
        }
        return cl;
    }
}
