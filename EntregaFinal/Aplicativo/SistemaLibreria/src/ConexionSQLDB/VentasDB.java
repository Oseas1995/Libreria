/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.Libro;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import oracle.jdbc.internal.OracleTypes;

/**
 *
 * @author Oseas
 */
public class VentasDB {
    public ArrayList<Libro> ListLibro(){
    ArrayList<Libro> libro=new ArrayList();
    
    try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_BUSCARLIBRO(?,?)}");
            cs.setString(1, new Libro().getNombre());
            cs.registerOutParameter(2, OracleTypes.CURSOR);
            
            cs.execute();
            
            //Se obtiene el cursor en forma de ResultSe 
            ResultSet rs = (ResultSet)cs.getObject(2);
            while (rs.next()){
                    Libro l = new Libro();
                    l.setIdLibro(rs.getInt("idLidro"));
                    l.setNombre(rs.getString("nombre"));
                    l.setAnioPublicacion(rs.getInt("anioPublicacion"));
                    l.setIdCategoria(rs.getInt("Categoria_idCategoria"));
                    l.setIdIdioma(rs.getInt("Idioma_idIdioma"));
                    l.setPrecioCosto(rs.getFloat("precioCosto"));
                    l.setPrecioVenta(rs.getFloat("precioVenta"));
                    l.setExistencia(rs.getInt("existencia"));
                    libro.add(l);
            } 

            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error");
        }
    
    return libro;
    }
    
    //buscar libro
    public Libro buscarLibro(String nom){
        Libro l = null;
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_BUSCARLIBRO(?,?)}");
            cs.setString(1, nom);
            
            cs.registerOutParameter(2, OracleTypes.CURSOR);
            
            cs.execute();
            
            //Se obtiene el cursor en forma de ResultSe 
            ResultSet rs = (ResultSet)cs.getObject(2);
            while (rs.next()){
                    l = new Libro();
                    l.setIdLibro(rs.getInt("idLibro"));
                    l.setNombre(rs.getString("nombre"));
                    l.setAnioPublicacion(rs.getInt("anioPublicacion"));
                    l.setIdCategoria(rs.getInt("Categoria_idCategoria"));
                    l.setIdIdioma(rs.getInt("Idioma_idIdioma"));
                    l.setPrecioCosto(rs.getFloat("precioCosto"));
                    l.setPrecioVenta(rs.getFloat("precioVenta"));
                    l.setExistencia(rs.getInt("existencia"));
                    //System.out.println(l.toString());
            } 

            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error");
        }
        return l;
    }
    
}
