
package main;

import controlador.Facade;
import controlador.TipoClase;
import java.sql.SQLException;
import java.util.List;
import modelo.Cliente;
import modelo.Estado;

public class ClinicaVeterinaria {
    public static void main(String[] args) throws SQLException {
        Facade facade = new Facade();
        
        
        // Crear un cliente
        Estado estado = new Estado(1, "prueba");
        Cliente nuevoCliente = new Cliente(0, "Omar", "omar8@prueba.com", "123456789", "direcion falsa 123", estado);
        try {
            facade.crear(nuevoCliente, TipoClase.CLIENTE);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        
//        // Listar clientes
//        try {
//            List<Cliente> clientes = facade.listar(TipoClase.CLIENTE);
//            for (Cliente cliente : clientes) {
//                System.out.println(cliente.getId() + ": " + cliente.getNombre() + ", " + cliente.getEmail() + ", " + cliente.getTelefono() + ", " + cliente.getDireccion());
//            }
//            //clientes.forEach(System.out::println);
//        } catch (NoSuchFieldException e) {
//            e.printStackTrace();
//        }
//
//        System.out.println("\n------------------------------------");
//        // Actualizar un cliente
//        try {
//            nuevoCliente.setNombre("Nuevo Nombre");
//            facade.actualizar(nuevoCliente, TipoClase.CLIENTE);
//            System.out.println("Nombre actualizado");
//        } catch (NoSuchFieldException e) {
//            e.printStackTrace();
//        }
//
//        // Listar clientes
//        try {
//            List<Cliente> clientes = facade.listar(TipoClase.CLIENTE);
//            for (Cliente cliente : clientes) {
//                System.out.println(cliente.getId() + ": " + cliente.getNombre() + ", " + cliente.getEmail() + ", " + cliente.getTelefono() + ", " + cliente.getDireccion());
//            }
//            //clientes.forEach(System.out::println);
//        } catch (NoSuchFieldException e) {
//            e.printStackTrace();
//        }

        // Cambiar estado de un cliente
//        try {
//            facade.cambiarEstado(nuevoCliente.getId(), Estado, TipoClase.CLIENTE);
//        } catch (NoSuchFieldException e) {
//            e.printStackTrace();
//        }
    }
}
