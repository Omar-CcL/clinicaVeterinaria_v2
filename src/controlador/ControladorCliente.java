package controlador;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Cliente;
import modelo.Estado;
import modelo.FactoryModelo;

public class ControladorCliente implements Operacion<Cliente> {
    private FactoryModelo factoryModelo;

    public ControladorCliente() throws SQLException {
        factoryModelo = new FactoryModelo();
    }

    @Override
    public void crear(Cliente cliente) {
        try {
            factoryModelo.getClientesModelo().ejecutarSP("Insert", cliente, null);
        } catch (SQLException ex) {
            Logger.getLogger(ControladorCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void actualizar(Cliente cliente) {
        try {
            factoryModelo.getClientesModelo().ejecutarSP("Update", cliente, cliente.getId());
        } catch (SQLException ex) {
            Logger.getLogger(ControladorCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Cliente> listar() {
        try {
            return factoryModelo.getClientesModelo().ejecutarSP("Select", null, null);
        } catch (SQLException ex) {
            Logger.getLogger(ControladorCliente.class.getName()).log(Level.SEVERE, null, ex);
            return Collections.emptyList(); // Return an empty list on error
        }
    }

    @Override
    public void cambiarEstado(int clienteId, Estado estado) {
        try {
            factoryModelo.getClientesModelo().ejecutarSP("Status", new Cliente(clienteId, null, null, null, null, estado), clienteId);
        } catch (SQLException ex) {
            Logger.getLogger(ControladorCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
