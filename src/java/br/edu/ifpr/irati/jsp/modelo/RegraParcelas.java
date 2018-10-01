package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "regrasparcelas")
public class RegraParcelas implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idRegraParcela;

    @Column(name = "parcela", nullable = false)
    private int parcela;

    @Column(name = "valorParcelado", nullable = false)
    private double valorParcelado;

    @ManyToOne
    @JoinColumn(name = "servico_tipoServico")
    private Servico servico;

    public RegraParcelas() {
        idRegraParcela = 0;
        parcela = 0;
        valorParcelado = 0.0;
        servico = new Servico();
    }

    public RegraParcelas(int idRegraParcela, int parcela, double valorParcelado, Servico servico) {
        this.idRegraParcela = idRegraParcela;
        this.parcela = parcela;
        this.valorParcelado = valorParcelado;
        this.servico = servico;
    }

    public int getIdRegraParcela() {
        return idRegraParcela;
    }

    public void setIdRegraParcela(int idRegraParcela) {
        this.idRegraParcela = idRegraParcela;
    }

    public int getParcela() {
        return parcela;
    }

    public void setParcela(int parcela) {
        this.parcela = parcela;
    }

    public double getValorParcelado() {
        return valorParcelado;
    }

    public void setValorParcelado(double valorParcelado) {
        this.valorParcelado = valorParcelado;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

}
