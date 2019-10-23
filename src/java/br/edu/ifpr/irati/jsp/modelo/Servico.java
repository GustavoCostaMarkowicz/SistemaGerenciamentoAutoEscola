package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.FetchType;
import org.hibernate.annotations.Type;

@Entity(name = "servico")
public class Servico implements Serializable {

    @Id
    @Column(name = "tiposervico", nullable = false, length = 50)
    private String tipoServico;

    @Column(name = "valorvista", nullable = false)
    private double valorVista;
    
    @Column(name = "categoria", nullable = false, length = 50)
    private String categoria;

    @OneToMany(mappedBy = "servico", fetch = FetchType.EAGER)
    private List<RegraParcelas> parcelas;
    
    @Type(type = "true_false")
    @Column(name = "visivel", nullable = true)
    private boolean visivel;

    public Servico() {
        tipoServico = "";
        valorVista = 0.0;
        categoria = "";
        parcelas = new ArrayList<>();
        visivel = true;
    }

    public Servico(String tipoServico, double valorVista, String categoria) {
        this.tipoServico = tipoServico;
        this.valorVista = valorVista;
        this.categoria = categoria;
        parcelas = new ArrayList<>();
        visivel = true;
    }

    public Servico(String tipoServico, double valorVista, String categoria, List<RegraParcelas> parcelas, boolean visivel) {
        this.tipoServico = tipoServico;
        this.valorVista = valorVista;
        this.categoria = categoria;
        this.parcelas = parcelas;
        this.visivel = visivel;
    }


    public String getTipoServico() {
        return tipoServico;
    }

    public void setTipoServico(String tipoServico) {
        this.tipoServico = tipoServico;
    }

    public double getValorVista() {
        return valorVista;
    }

    public void setValorVista(double valorVista) {
        this.valorVista = valorVista;
    }

    public List<RegraParcelas> getParcelas() {
        return parcelas;
    }

    public void setParcelas(List<RegraParcelas> parcelas) {
        this.parcelas = parcelas;
    }

    public boolean isVisivel() {
        return visivel;
    }

    public void setVisivel(boolean visivel) {
        this.visivel = visivel;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

}
