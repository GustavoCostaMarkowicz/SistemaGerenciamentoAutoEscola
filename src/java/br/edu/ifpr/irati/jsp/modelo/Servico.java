package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Proxy;

@Entity(name = "servico")
public class Servico implements Serializable {

    @Id
    @Column(name = "tiposervico", nullable = false, length = 50)
    private String tipoServico;

    @Column(name = "valorvista", nullable = false)
    private double valorVista;

    @OneToMany(mappedBy = "servico")
    private List<RegraParcelas> parcelas;

    public Servico() {
        tipoServico = "";
        valorVista = 0.0;
        parcelas = new ArrayList<>();
    }
    
    public Servico(String tipoServico, double valorVista) {
        this.tipoServico = tipoServico;
        this.valorVista = valorVista;
        parcelas = new ArrayList<>();
    }
    
    public Servico(String tipoServico, double valorVista, List<RegraParcelas> parcelas) {
        this.tipoServico = tipoServico;
        this.valorVista = valorVista;
        this.parcelas = parcelas;
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

}
