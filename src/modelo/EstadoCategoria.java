
package modelo;

public class EstadoCategoria {
    private int estadoCategoriaId;
    private Estado estado;
    private Categoria categoria;

    public EstadoCategoria(int estadoCategoriaId, Estado estado, Categoria categoria) {
        this.estadoCategoriaId = estadoCategoriaId;
        this.estado = estado;
        this.categoria = categoria;
    }

    public int getEstadoCategoriaId() {
        return estadoCategoriaId;
    }

    public void setEstadoCategoriaId(int estadoCategoriaId) {
        this.estadoCategoriaId = estadoCategoriaId;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
}
