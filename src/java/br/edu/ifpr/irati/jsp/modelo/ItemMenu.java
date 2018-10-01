package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.Type;

@Entity(name = "itemmenu")
public class ItemMenu implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idItemMenu;
    
    @Column(name="valor", nullable = false, length = 120)
    private String valor;
    
    @Column(name = "url", nullable = false, length = 200)
    private String url;
    
    @Column(name = "icone", nullable = true, length = 150)
    private String icone;
    
    @Type(type = "true_false")
    @Column(name = "visivel", nullable = true)
    private boolean visivel;
    
    @Type(type = "true_false")
    @Column(name = "aberta", nullable = true)
    private boolean aberta;

    public ItemMenu() {
        idItemMenu = 0;
        valor = "";
        url = "";
        icone = "";
        visivel = true;
        aberta = true;
    }

    public ItemMenu(int iditemmenu, String valor, String url, boolean visivel, boolean aberta) {
        this.idItemMenu = idItemMenu;
        this.valor = valor;
        this.url = url;
        this.icone = "";
        this.visivel = visivel;
        this.aberta = aberta;
    }

    public ItemMenu(int idItemMenu, String valor, String url, String icone, boolean visivel, boolean aberta) {
        this.idItemMenu = idItemMenu;
        this.valor = valor;
        this.url = url;
        this.icone = icone;
        this.visivel = visivel;
        this.aberta = aberta;
    }

    public int getIdItemMenu() {
        return idItemMenu;
    }

    public void setIdItemMenu(int idItemMenu) {
        this.idItemMenu = idItemMenu;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public boolean isVisivel() {
        return visivel;
    }

    public void setVisivel(boolean visivel) {
        this.visivel = visivel;
    }

    public boolean isAberta() {
        return aberta;
    }

    public void setAberta(boolean aberta) {
        this.aberta = aberta;
    }

}
