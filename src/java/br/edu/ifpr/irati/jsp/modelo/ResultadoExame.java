package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Type;

@Entity(name = "resultadoexame")
public class ResultadoExame implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "aluno_idPessoa")
    private Aluno aluno;

    @ManyToOne
    @JoinColumn(name = "exame_idExame")
    private Exame exame;

    @Type(type = "true_false")
    @Column(name = "resultado", nullable = true)
    private boolean resultado;

    public ResultadoExame() {
        aluno = new Aluno();
        exame = new Exame();
        resultado = false;
    }

    public ResultadoExame(Aluno aluno, Exame exame, boolean resultado) {
        this.aluno = aluno;
        this.exame = exame;
        this.resultado = resultado;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Exame getExame() {
        return exame;
    }

    public void setExame(Exame exame) {
        this.exame = exame;
    }

    public boolean isResultado() {
        return resultado;
    }

    public void setResultado(boolean resultado) {
        this.resultado = resultado;
    }

}
