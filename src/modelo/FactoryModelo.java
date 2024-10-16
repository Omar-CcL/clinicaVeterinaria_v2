
package modelo;

import java.sql.Connection;
import java.sql.SQLException;

public class FactoryModelo {
    private Connection connection;

    public FactoryModelo() throws SQLException {
        this.connection = Singleton.getInstance().getConnection();
    }

    public ClienteModelo getClientesModelo() {
        return new ClienteModelo(connection);
    }
    
    public MascotaModelo getMascotaModelo() {
        return new MascotaModelo(connection);
    }

}
