package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "exameteorico")
@PrimaryKeyJoinColumn(name = "idExame")
public class ExameTeorico extends Exame implements Serializable {

    @Column(name = "servico", nullable = false, length = 80)
    private String servico;

    @Column(name = "localaplicacao", nullable = true, length = 50)
    private String localAplicacao;

    @ManyToOne
    @JoinColumn(name = "instrutor_idPessoa")
    private Instrutor instrutor;

    public ExameTeorico() {
        servico = "";
        localAplicacao = "";
        instrutor = new Instrutor();
    }

    public ExameTeorico(String servico, String localAplicacao, Instrutor instrutor, int idExame, Date dataExame, Date horarioExame, List<ResultadoExame> resultadoExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, resultadoExame, maximoAlunos, reteste, alunos);
        this.servico = servico;
        this.localAplicacao = localAplicacao;
        this.instrutor = instrutor;
    }

    public String getLocalAplicacao() {
        return localAplicacao;
    }

    public void setLocalAplicacao(String localAplicacao) {
        this.localAplicacao = localAplicacao;
    }

    public Instrutor getInstrutor() {
        return instrutor;
    }

    public void setInstrutor(Instrutor instrutor) {
        this.instrutor = instrutor;
    }

    public String getServico() {
        return servico;
    }

    public void setServico(String servico) {
        this.servico = servico;
    }

}
