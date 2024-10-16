
package modelo;

public class Raza {
    private int id;
    private String nombre;
    private Especie especie;
    private Estado estado;

    public Raza(int id, String nombre, Especie especie, Estado estado) {
        this.id = id;
        this.nombre = nombre;
        this.especie = especie;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Especie getEspecie() {
        return especie;
    }

    public void setEspecie(Especie especie) {
        this.especie = especie;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
