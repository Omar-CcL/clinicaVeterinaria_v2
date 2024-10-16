
package controlador;

import java.util.List;
import modelo.Estado;

public interface Operacion<T> {
    void crear(T objeto);
    void actualizar(T objeto);
    List<T> listar();
    void cambiarEstado(int a, Estado b);
}

