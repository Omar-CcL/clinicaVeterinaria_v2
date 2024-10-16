
package controlador;

import java.sql.SQLException;
import java.util.List;
import modelo.Estado;

public class Facade {
    private final FactorySystem factorySystem;
    
    public Facade() {
        this.factorySystem = new FactorySystem();
    }

    public <T> void crear(T objeto, TipoClase tipoClase) throws NoSuchFieldException, SQLException {
        Operacion<T> operacion = factorySystem.obtenerOperacion(tipoClase);
        operacion.crear(objeto);
    }

    public <T> void actualizar(T objeto, TipoClase tipoClase) throws NoSuchFieldException, SQLException {
        Operacion<T> operacion = factorySystem.obtenerOperacion(tipoClase);
        operacion.actualizar(objeto);
    }

    public <T> List<T> listar(TipoClase tipoClase) throws NoSuchFieldException, SQLException {
        Operacion<T> operacion = factorySystem.obtenerOperacion(tipoClase);
        return operacion.listar();
    }


    public void cambiarEstado(int id, Estado estado, TipoClase tipoClase) throws NoSuchFieldException, SQLException {
        Operacion<?> operacion = factorySystem.obtenerOperacion(tipoClase);
        operacion.cambiarEstado(id, estado);
    }
}
