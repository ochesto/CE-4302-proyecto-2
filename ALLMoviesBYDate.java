/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ati;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.util.Date;

/**
 *
 * @author geovanny
 */
public class ALLMoviesBYDate extends javax.swing.JFrame {

    /**
     * Creates new form ALLMoviesBYDate
     */
    public ALLMoviesBYDate() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(null);

        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        getContentPane().add(jTextField1);
        jTextField1.setBounds(220, 50, 150, 30);

        jButton1.setText("Consultar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1);
        jButton1.setBounds(410, 50, 140, 25);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Nombre", "Genero", "Director", "Franquicia", "Pais", "AnoEstreno", "Duracion(min)", "Compania productora"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1);
        jScrollPane1.setBounds(0, 120, 1410, 40);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed

    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        MongoClient mongoClient = new MongoClient();

        DB database = mongoClient.getDB("ATIDB");

        //Gets a collection with a given name.
        //If the collection does not exist, a new collection is created.
        DBCollection collection = database.getCollection("Movies");
        DBCursor results = collection.find(new BasicDBObject("Nombre", jTextField1.getText()));

          BasicDBObject query = new BasicDBObject();
    query.put("Nombre", jTable1.getModel().getValueAt(0, 0) );
    
    Date start = new java.util.Date(2012, 06, 20, 10, 05);
Date end = new java.util.Date(2012, 06, 20, 10, 30);


    
        
        
        
        BasicDBObject obj = (BasicDBObject) results.next();
        jTable1.setValueAt(obj.getString("Nombre"), 0, 0);
        jTable1.setValueAt(obj.getString("Genero"), 0, 1);
        jTable1.setValueAt(obj.getString("Director"), 0, 2);
        jTable1.setValueAt(obj.getString("Franquicia"), 0, 3);
        jTable1.setValueAt(obj.getString("Pais"), 0, 4);
        jTable1.setValueAt(obj.getString("Ano de estreno"), 0, 5);
        jTable1.setValueAt(obj.getString("Duracion"), 0, 6);
        jTable1.setValueAt(obj.getString("Compania Productora"), 0, 7);
        
        for(int i=0; i<=results.size();i++){
            jTable1.setValueAt(obj.getString("Nombre"), i, 0);
            jTable1.setValueAt(obj.getString("Genero"), i, 1);
           // jTable1.setValueAt(obj.getString("Ano de estreno"), 0, 2);
            obj = (BasicDBObject) results.next();
             
        }
        
        

        //collection.updateOne(filter, updateOperationDocument);

    }//GEN-LAST:event_jButton1ActionPerformed

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
            java.util.logging.Logger.getLogger(ALLMoviesBYDate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ALLMoviesBYDate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ALLMoviesBYDate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ALLMoviesBYDate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ALLMoviesBYDate().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
