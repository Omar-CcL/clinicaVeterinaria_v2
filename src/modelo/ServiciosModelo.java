
package modelo;

import java.sql.Connection;

public class ServiciosModelo {
    private Connection connection;

    public ServiciosModelo(Connection connection) {
        this.connection = connection;
    }
}
