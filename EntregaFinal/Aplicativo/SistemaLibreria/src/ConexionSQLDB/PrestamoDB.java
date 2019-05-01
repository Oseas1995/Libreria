/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import Clases.principales.Libro;
import Clases.principales.Prestamo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import oracle.jdbc.internal.OracleTypes;

/**
 *
 * @author Oseas
 */
public class PrestamoDB {
    public void insertarPrestamo(Prestamo v){
        try{
            
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_GESTION_PRESTAMOSLIBROS(?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, v.getIdLibro());
            cs.setInt(2, v.getIdCliente());
            cs.setInt(3, v.getIdTipoObtencion());
            cs.setInt(4, v.getCantidadDias());
            cs.setInt(5, v.getIdTipoPago());
            cs.registerOutParameter(6, java.sql.Types.VARCHAR);
            cs.registerOutParameter(7, java.sql.Types.VARCHAR);
            cs.registerOutParameter(8, java.sql.Types.INTEGER);
            cs.registerOutParameter(9, java.sql.Types.VARCHAR);
            
            cs.execute();
            
            String fechaInicio = cs.getString(6);
            String fechaMax = cs.getString(7);
            
            v.setFechaInicio(fechaInicio);
            v.setFechaMax(fechaMax);
            
            int error = cs.getInt(8);
            String mensajeError = cs.getString(9);
            
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
    
    //buscar libro
    public Libro buscarLibro(String nom){
        Libro l = null;
        try{
            Connection cnx = DataBaseConnect.getConnection();
            CallableStatement cs = cnx.prepareCall("{call SP_BUSCARLIBRO(?,?,?,?)}");
            cs.setString(1, nom);
            
            cs.registerOutParameter(2, OracleTypes.CURSOR);
            cs.registerOutParameter(3, java.sql.Types.INTEGER);
            cs.registerOutParameter(4, java.sql.Types.VARCHAR);
            
            cs.execute();
            
            int error = cs.getInt(3);
            String mensaje = cs.getString(4);
            
            if (error == 1){
                JOptionPane.showMessageDialog(null, mensaje,"ERROR!!",JOptionPane.ERROR_MESSAGE);
            }else{
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
            }
            

            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error");
        }
        return l;
    }
}