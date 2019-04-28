/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQLDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Oseas
 */
public class DataBaseConnect {
    public static Connection getConnection(){
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String myDB="jdbc:oracle:thin:@localhost:1521:XE";
        String usuario="asd";
        String password="oracle";
        
        Connection cnx = DriverManager.getConnection(myDB,usuario,password);
        
        return cnx;
        
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(DataBaseConnect.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
    }
}
