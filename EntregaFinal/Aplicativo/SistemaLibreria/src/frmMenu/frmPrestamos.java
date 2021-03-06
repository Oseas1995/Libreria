/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frmMenu;

import Clases.principales.Cliente;
import Clases.principales.Libro;
import Clases.principales.Prestamo;
import Clases.principales.TipoObtencion;
import Clases.principales.TipoPago;
import ConexionSQLDB.ClienteDB;
import ConexionSQLDB.PrestamoDB;
import ConexionSQLDB.TipoObtencionDB;
import ConexionSQLDB.TipoPagoDB;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author davef
 */
public class frmPrestamos extends javax.swing.JFrame {
    int idTipoObtencion;
    int idTipoPago;
    int idCliente;
    
    ArrayList<Libro>libro;
    
    ArrayList<Prestamo>prestamo;
    PrestamoDB db=new PrestamoDB();
    
    ArrayList<TipoObtencion> tipoOb;
    TipoObtencionDB tipoObtencionDB=new TipoObtencionDB();
    
    ArrayList<TipoPago> tipoPago;
    TipoPagoDB tipoPagoDB=new TipoPagoDB();
    
    ArrayList<Cliente> cliente;
    ClienteDB clienteDB=new ClienteDB();

    /**
     * Creates new form frmPrestamos
     */
    public frmPrestamos() {
        initComponents();
        
        LimpiarFormulario();
        
        this.cboTipoObtencion.removeAllItems();
        this.cboFormaPago.removeAllItems();
        this.cboNombreCliente.removeAllItems();
        
        traerTipoObtencion();
        traerFormaPago();
        traerCliente();
        
        this.setLocationRelativeTo(null);
    }

    
    public void obtenerTotal(){
        float fila = 0;
        float total = 0;
        
        for (int i=0 ; i < tblPrestamos.getRowCount() ; i++){
            fila = Float.parseFloat(tblPrestamos.getValueAt(i, 6).toString());
            total += fila;
        }
        lblTotal.setText("El total es: " + total);
                
    }
    
    public void traerTipoObtencion() {
        cboTipoObtencion.addItem("Seleccione...");
        tipoOb = tipoObtencionDB.ListTipoObtencion();
        for (TipoObtencion to : tipoOb) {
            cboTipoObtencion.addItem(to.getDescripcion());
        }
    }
    
    public void traerFormaPago() {
        cboFormaPago.addItem("Seleccione...");
        tipoPago = tipoPagoDB.ListTipoPago();
        for (TipoPago tp : tipoPago) {
            cboFormaPago.addItem(tp.getDescripcion());
        }
    }
    
    public void traerCliente() {
        cboNombreCliente.addItem("Seleccione...");
        cliente = clienteDB.ListCliente();
        for (Cliente c : cliente) {
            cboNombreCliente.addItem(c.getpNombre()+" "+ c.getsNombre()+" "+c.getpApellido()+" "+c.getsApellido());
        }
    }
    
    public void LimpiarFormulario(){
        DefaultTableModel tb=(DefaultTableModel)tblPrestamos.getModel();
        for(int i = tb.getRowCount()-1;i >= 0; i--){
            tb.removeRow(i);
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtIdLibro = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtCantidadDias = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        txtNombreLibro = new javax.swing.JTextField();
        cboNombreCliente = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        cboTipoObtencion = new javax.swing.JComboBox<>();
        cboFormaPago = new javax.swing.JComboBox<>();
        jPanel2 = new javax.swing.JPanel();
        btnPrestar = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        btnBuscar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPrestamos = new javax.swing.JTable();
        jPanel4 = new javax.swing.JPanel();
        lblTotal = new javax.swing.JLabel();
        btnObtenerTotal = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Prestar Libro");

        jLabel1.setText("id Libro");

        txtIdLibro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIdLibroActionPerformed(evt);
            }
        });

        jLabel3.setText("Nombre Cliente");

        jLabel4.setText("Cantidad Dias");

        jLabel5.setText("Forma Pago");

        txtCantidadDias.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCantidadDiasActionPerformed(evt);
            }
        });

        jLabel8.setText("Nombre Libro");

        txtNombreLibro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtNombreLibroActionPerformed(evt);
            }
        });

        cboNombreCliente.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cboNombreCliente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboNombreClienteActionPerformed(evt);
            }
        });

        jLabel7.setText("Tipo Obtencion");

        cboTipoObtencion.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cboTipoObtencion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboTipoObtencionActionPerformed(evt);
            }
        });

        cboFormaPago.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cboFormaPago.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboFormaPagoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8)
                    .addComponent(jLabel1)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(jLabel7))
                .addGap(31, 31, 31)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtIdLibro)
                    .addComponent(txtNombreLibro)
                    .addComponent(cboNombreCliente, javax.swing.GroupLayout.Alignment.LEADING, 0, 207, Short.MAX_VALUE)
                    .addComponent(txtCantidadDias)
                    .addComponent(cboTipoObtencion, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(cboFormaPago, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtNombreLibro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtIdLibro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cboNombreCliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(cboTipoObtencion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtCantidadDias, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(cboFormaPago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(25, Short.MAX_VALUE))
        );

        btnPrestar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/nuevo.png"))); // NOI18N
        btnPrestar.setText("PRESTAR");
        btnPrestar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPrestarActionPerformed(evt);
            }
        });

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salir.png"))); // NOI18N
        btnSalir.setText("SALIR");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });

        btnBuscar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/lupa.png"))); // NOI18N
        btnBuscar.setText("BUSCAR");
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(btnPrestar, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(79, 79, 79)
                        .addComponent(btnSalir, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(22, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnPrestar, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(39, 39, 39)
                .addComponent(btnSalir, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(61, 61, 61))
        );

        tblPrestamos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Numero", "Descripcion", "Fecha Inicio", "Fecha Maxima", "Cantidad Dias", "Tarifa", "MontoPagar"
            }
        ));
        tblPrestamos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                tblPrestamosMousePressed(evt);
            }
        });
        jScrollPane1.setViewportView(tblPrestamos);

        lblTotal.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        lblTotal.setText("El total es: ");

        btnObtenerTotal.setText("Obtener total");
        btnObtenerTotal.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnObtenerTotalActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(btnObtenerTotal)
                .addGap(33, 33, 33)
                .addComponent(lblTotal)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblTotal)
                    .addComponent(btnObtenerTotal))
                .addContainerGap(38, Short.MAX_VALUE))
        );

        jMenu1.setText("INICIO");

        jMenuItem1.setText("Regresar");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, 735, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(20, 20, 20))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jPanel4, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jScrollPane1))
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(jLabel2)
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        this.dispose();
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void txtIdLibroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIdLibroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtIdLibroActionPerformed

    private void txtCantidadDiasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCantidadDiasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtCantidadDiasActionPerformed

    private void txtNombreLibroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtNombreLibroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtNombreLibroActionPerformed

    private void btnPrestarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPrestarActionPerformed
        Prestamo v = new Prestamo();
        v.setIdLibro(Integer.parseInt(txtIdLibro.getText()));
        v.setIdCliente(idCliente);
        v.setIdTipoObtencion(idTipoObtencion);
        v.setIdTipoPago(idTipoPago);
        v.setCantidadDias(Integer.parseInt(txtCantidadDias.getText()));
        v.setNombreLibro(txtNombreLibro.getText());
        
        
        
        db.insertarPrestamo(v);
        
        DefaultTableModel tb=(DefaultTableModel)tblPrestamos.getModel();
        tb.addRow(new Object[]{tblPrestamos.getRowCount()+1,v.getNombreLibro(),v.getFechaInicio(),v.getFechaMax(),v.getCantidadDias(),2,v.getCantidadDias()*2});
        
    }//GEN-LAST:event_btnPrestarActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        System.exit(0);
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarActionPerformed
        Libro l = null;
        String buscarLibro = txtNombreLibro.getText();
        //System.out.println(buscarLibro);
        
        l = db.buscarLibro(buscarLibro);
        if (l != null){
            int opc = JOptionPane.showConfirmDialog(this, l.toString() + "\n\nDESEA COMPRAR ESTE PRODUCTO???","Pregunta",JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
            //JOptionPane.showInputDialog(this, l.toString());
            if(opc == JOptionPane.YES_OPTION){
                txtIdLibro.setText(Integer.toString(l.getIdLibro()));
            }
        }
    }//GEN-LAST:event_btnBuscarActionPerformed

    private void tblPrestamosMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblPrestamosMousePressed

    }//GEN-LAST:event_tblPrestamosMousePressed

    private void cboTipoObtencionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboTipoObtencionActionPerformed
        try{
            TipoObtencion to;
            String pro = cboTipoObtencion.getSelectedItem().toString();
            to = tipoObtencionDB.getTipoObtencion(pro);
            if(to != null){
                idTipoObtencion = to.getId();
                System.out.println("idTipoObtencion: "+idTipoObtencion);
            }
        } catch(Exception e){}
    }//GEN-LAST:event_cboTipoObtencionActionPerformed

    private void cboFormaPagoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboFormaPagoActionPerformed
        try{
            TipoPago tp;
            String pro = cboFormaPago.getSelectedItem().toString();
            tp = tipoPagoDB.getTipoPago(pro);
            if(tp != null){
                idTipoPago = tp.getId();
                System.out.println("idTipoPago: "+idTipoPago);
            }
        } catch(Exception e){}
    }//GEN-LAST:event_cboFormaPagoActionPerformed

    private void cboNombreClienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboNombreClienteActionPerformed
        try{
            Cliente tp;
            String pro = cboNombreCliente.getSelectedItem().toString();
            tp = clienteDB.getCliente(pro);
            if(tp != null){
                idCliente = tp.getIdCliente();
                System.out.println("idCliente: "+idCliente);
            }
        } catch(Exception e){}
    }//GEN-LAST:event_cboNombreClienteActionPerformed

    private void btnObtenerTotalActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnObtenerTotalActionPerformed
        obtenerTotal();
    }//GEN-LAST:event_btnObtenerTotalActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmPrestamos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmPrestamos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmPrestamos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmPrestamos.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmPrestamos().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnObtenerTotal;
    private javax.swing.JButton btnPrestar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JComboBox<String> cboFormaPago;
    private javax.swing.JComboBox<String> cboNombreCliente;
    private javax.swing.JComboBox<String> cboTipoObtencion;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblTotal;
    private javax.swing.JTable tblPrestamos;
    private javax.swing.JTextField txtCantidadDias;
    private javax.swing.JTextField txtIdLibro;
    private javax.swing.JTextField txtNombreLibro;
    // End of variables declaration//GEN-END:variables
}
