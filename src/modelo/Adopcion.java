
package modelo;

import java.time.LocalDate;

public class Adopcion {
    private int id;
    private Cliente cliente;
    private Mascota mascota;
    private Estado estado;
    private LocalDate fecha_publicacion;
    private LocalDate fecha_adopcion;

    public Adopcion(int id, Cliente cliente, Mascota mascota, Estado estado, LocalDate fecha_publicacion, LocalDate fecha_adopcion) {
        this.id = id;
        this.cliente = cliente;
        this.mascota = mascota;
        this.estado = estado;
        this.fecha_publicacion = fecha_publicacion;
        this.fecha_adopcion = fecha_adopcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public LocalDate getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(LocalDate fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public LocalDate getFecha_adopcion() {
        return fecha_adopcion;
    }

    public void setFecha_adopcion(LocalDate fecha_adopcion) {
        this.fecha_adopcion = fecha_adopcion;
    }
    
    
}
