
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Singleton {
    
    private static Singleton instance;
    private Connection connection;

    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=ClinicaVeterinaria;trustServerCertificate=true";
    private static final String USER = "userClinVet";
    private static final String PASSWORD = "123";

    private Singleton() throws SQLException {
        connection = DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    public static Singleton getInstance() {
        if (instance == null) {
            synchronized (Singleton.class) {
                if (instance == null) {
                    try {
                        instance = new Singleton();
                    } catch (SQLException e) {
                        throw new RuntimeException("Error al obtener la conexión a la base de datos", e);
                    }
                }
            }
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                connection = null; // No volver a cerrar la conexión
            }
        }
    }
}
