package Controlador;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
     
    private static Connection con=null; //Obtiene la conexion a la base de datos
    private static boolean conectado=false;
    
    
    public static void Conex(){    
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");//cargamos la clase y al cargarse la clase se registra como jdbc.Registra el drive de conexión.
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/VETE","vete","vete"); 
            System.out.println("Conectado correctamente");
        
            conectado = true;
                    
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error en la conexión");
            System.err.println("Error en la conexion");
        }
        
        
    }
    public static void cerrarConexionBaseDatos(){
        try
        {
            con.commit();
            con.close();
            conectado=false;
            
        }
        catch(SQLException e)
        {
            
        }
        
    }
    
    public static Connection getConexion() 
    {
        return con;
    }

    public static boolean isConectado() {
        return conectado;
    }
    
}