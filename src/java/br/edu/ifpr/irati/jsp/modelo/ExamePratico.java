package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "examepratico")
@PrimaryKeyJoinColumn(name = "idExame")
public class ExamePratico extends Exame implements Serializable {

    @Column(name = "categoria", nullable = false, length = 2)
    private String categoria;

    @ManyToOne
    @JoinColumn(name = "instrutor_idPessoa")
    private Instrutor instrutor;

    @ManyToOne
    @JoinColumn(name = "veiculo_placa")
    private Veiculo veiculo;

    public ExamePratico() {
        categoria = "";
        instrutor = new Instrutor();
        veiculo = new Veiculo();
    }

    public ExamePratico(String categoria, Instrutor instrutor, Veiculo veiculo, int idExame, Date dataExame, Date horarioExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, maximoAlunos, reteste, alunos);
        this.categoria = categoria;
        this.instrutor = instrutor;
        this.veiculo = veiculo;
    }

    public ExamePratico(String categoria, Instrutor instrutor, Veiculo veiculo, int idExame, Date dataExame, Date horarioExame, List<ResultadoExame> resultadoExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, resultadoExame, maximoAlunos, reteste, alunos);
        this.categoria = categoria;
        this.instrutor = instrutor;
        this.veiculo = veiculo;
    }

    public Instrutor getInstrutor() {
        return instrutor;
    }

    public void setInstrutor(Instrutor instrutor) {
        this.instrutor = instrutor;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

}
