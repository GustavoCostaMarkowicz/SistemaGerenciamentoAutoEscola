package br.edu.ifpr.irati.jsp.modelo;

import java.util.Date;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "conta")
public class Conta implements Serializable {

    @Id
    @OneToOne
    private Aluno aluno;
    
    @Column(name = "valorinicial", nullable = false)
    private double valorInicial;

    @Column(name = "valorpago", nullable = true)
    private double valorPago;

    @Column(name = "parcelas", nullable = false)
    private int parcelas;
    
    @Temporal(TemporalType.DATE)
    private Date mesPrimeiraParcela;

    @Column(name = "anotacoes", nullable = true, length = 65000)
    private String anotacoes;

    @ManyToMany
    private List<Registro> registros;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Servico> servicos;

    public Conta() {
        valorInicial = 0.0;
        valorPago = 0.0;
        parcelas = 0;
        mesPrimeiraParcela = new Date();
        aluno = new Aluno();
        registros = new ArrayList<>();
        servicos = new ArrayList<>();
        anotacoes = "";
    }

    public Conta(double valorInicial, double valorPago, int parcelas, Date mesPrimeiraParcela, Aluno aluno, List<Servico> servicos, String anotacoes) {
        this.valorInicial = valorInicial;
        this.valorPago = valorPago;
        this.parcelas = parcelas;
        this.mesPrimeiraParcela = mesPrimeiraParcela;
        this.aluno = aluno;
        registros = new ArrayList<>();
        this.servicos = servicos;
        this.anotacoes = anotacoes;
    }

    public Conta(double valorInicial, double valorPago, int parcelas, Date mesPrimeiraParcela, Aluno aluno, List<Registro> registros, List<Servico> servicos, String anotacoes) {
        this.valorInicial = valorInicial;
        this.valorPago = valorPago;
        this.parcelas = parcelas;
        this.mesPrimeiraParcela = mesPrimeiraParcela;
        this.aluno = aluno;
        this.registros = registros;
        this.servicos = servicos;
        this.anotacoes = anotacoes;
    }

    public void adicionarRegistro(Registro registro) {
        this.registros.add(registro);
        registro.setConta(this);
    }

    public void removerRegistro(Registro registro) {
        this.registros.remove(registro);
        registro.setConta(new Conta());
    }

    public int getParcelas() {
        return parcelas;
    }

    public void setParcelas(int parcelas) {
        this.parcelas = parcelas;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public List<Registro> getRegistros() {
        return registros;
    }

    public void setRegistros(List<Registro> registros) {
        this.registros = registros;
    }

    public List<Servico> getServicos() {
        return servicos;
    }

    public void setServicos(List<Servico> servicos) {
        this.servicos = servicos;
    }

    public double getValorPago() {
        return valorPago;
    }

    public void setValorPago(double valorPago) {
        this.valorPago = valorPago;
    }

    public String getAnotacoes() {
        return anotacoes;
    }

    public void setAnotacoes(String anotacoes) {
        this.anotacoes = anotacoes;
    }

    public double getValorInicial() {
        return valorInicial;
    }

    public void setValorInicial(double valorinicial) {
        this.valorInicial = valorinicial;
    }

    public Date getMesPrimeiraParcela() {
        return mesPrimeiraParcela;
    }

    public void setMesPrimeiraParcela(Date mesPrimeiraParcela) {
        this.mesPrimeiraParcela = mesPrimeiraParcela;
    }

}
