
package controlador;

import java.sql.SQLException;

public class FactorySystem {
    
    public Operacion obtenerOperacion(TipoClase tipoClase)throws NoSuchFieldException, SQLException {
        
        return switch (tipoClase) {
            case ADOPCION -> new ControladorAdopcion();
            //case CATEGORIA -> new ControladorCategoria();
            case CITA -> new ControladorCita();
            case CLIENTE -> new ControladorCliente();
            case CONSEJO -> new ControladorConsejo();
            case CUIDADO -> new ControladorCuidado();
            case ESPECIE -> new ControladorEspecie();
            //case ESTADO -> new ControladorEstado();
            //case ESTADOCATEGORIA -> new ControladorAdopcion();
            case MASCOTA -> new ControladorMascota();
            case PEDIDO -> new ControladorPedido();
            case PEDIDODETALLE -> new ControladorPedidoDetalle();
            case PRODUCTO -> new ControladorProducto();
            case RAZA -> new ControladorRaza();
            case SERVICIO -> new ControladorServicio();
            default -> throw new NoSuchFieldException("TipoOperacion no soportado: " + tipoClase);
        };
    }
}
