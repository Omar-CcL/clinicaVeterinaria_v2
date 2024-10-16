
package modelo;

import java.time.LocalDate;

public class Cita {
    private int id;
    private LocalDate fecha_cita;
    private Mascota mascota;
    private Servicio servicio;
    private Cliente cliente;
    private Estado estado;

    public Cita(int id, LocalDate fecha_cita, Mascota mascota, Servicio servicio, Cliente cliente, Estado estado) {
        this.id = id;
        this.fecha_cita = fecha_cita;
        this.mascota = mascota;
        this.servicio = servicio;
        this.cliente = cliente;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getFecha_cita() {
        return fecha_cita;
    }

    public void setFecha_cita(LocalDate fecha_cita) {
        this.fecha_cita = fecha_cita;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
