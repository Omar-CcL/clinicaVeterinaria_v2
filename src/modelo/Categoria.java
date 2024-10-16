
package modelo;

public class Categoria {
    private int categoriaId;
    private String nombreCategoria;

    public Categoria(int categoriaId, String nombreCategoria) {
        this.categoriaId = categoriaId;
        this.nombreCategoria = nombreCategoria;
    }

    public int getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(int categoriaId) {
        this.categoriaId = categoriaId;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }
    
}
