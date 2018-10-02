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
    @ManyToOne
    @JoinColumn(name = "servico_tipoServico")
    private Servico servico;

    @Column(name = "parcela", nullable = false)
    private int parcela;

    @Column(name = "valorParcelado", nullable = false)
    private double valorParcelado;

    public RegraParcelas() {
        parcela = 0;
        valorParcelado = 0.0;
        servico = new Servico();
    }

    public RegraParcelas(int parcela, double valorParcelado, Servico servico) {
        this.parcela = parcela;
        this.valorParcelado = valorParcelado;
        this.servico = servico;
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
