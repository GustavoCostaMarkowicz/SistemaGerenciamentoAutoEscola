package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity(name = "conta")
public class Conta implements Serializable {

    @Id
    @OneToOne
    private Aluno aluno;

    @Column(name = "valortotal", nullable = false)
    private double valorTotal;

    @Column(name = "parcelas", nullable = false)
    private int parcelas;

    @ManyToMany
    private List<Registro> registros;

    @OneToMany
    private List<Servico> servico;

    public Conta() {
        valorTotal = 0.0;
        parcelas = 0;
        aluno = new Aluno();
        registros = new ArrayList<>();
        servico = new ArrayList<>();
    }

    public Conta(double valorTotal, int parcelas, Aluno aluno, List<Servico> servico) {
        this.valorTotal = valorTotal;
        this.parcelas = parcelas;
        this.aluno = aluno;
        registros = new ArrayList<>();
        this.servico = servico;
    }

    public Conta(double valorTotal, int parcelas, Aluno aluno, List<Registro> registros, List<Servico> servico) {
        this.valorTotal = valorTotal;
        this.parcelas = parcelas;
        this.aluno = aluno;
        this.registros = registros;
        this.servico = servico;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
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

    public List<Servico> getServico() {
        return servico;
    }

    public void setServico(List<Servico> servico) {
        this.servico = servico;
    }

}
