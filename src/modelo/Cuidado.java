
package modelo;

public class Cuidado {
    private int id;
    private Especie especie;
    private Raza raza;
    private String cuidados;
    private String recomendaciones;
    private Estado estado;

    public Cuidado(int id, Especie especie, Raza raza, String cuidados, String recomendaciones, Estado estado) {
        this.id = id;
        this.especie = especie;
        this.raza = raza;
        this.cuidados = cuidados;
        this.recomendaciones = recomendaciones;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCuidados() {
        return cuidados;
    }

    public void setCuidados(String cuidados) {
        this.cuidados = cuidados;
    }

    public String getRecomendaciones() {
        return recomendaciones;
    }

    public void setRecomendaciones(String recomendaciones) {
        this.recomendaciones = recomendaciones;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
