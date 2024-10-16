
package modelo;

import java.time.LocalDate;

public class Consejo {
    private int id;
    private String titulo;
    private String contenido;
    private Especie especie;
    private Raza raza;
    private LocalDate fecha;
    private Estado estado;

    public Consejo(int id, String titulo, String contenido, Especie especie, Raza raza, LocalDate fecha, Estado estado) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.especie = especie;
        this.raza = raza;
        this.fecha = fecha;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Especie getEspecie() {
        return especie;
    }

    public void setEspecie(Especie especie) {
        this.especie = especie;
    }

    public Raza getRaza() {
        return raza;
    }

    public void setRaza(Raza raza) {
        this.raza = raza;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
