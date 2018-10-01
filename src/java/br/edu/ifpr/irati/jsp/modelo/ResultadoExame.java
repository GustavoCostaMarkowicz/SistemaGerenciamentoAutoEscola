package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "resultadoexame")
public class ResultadoExame implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idResultadoExame;

    @ManyToOne
    @JoinColumn(name = "aluno_idPessoa")
    private Aluno aluno;

    @ManyToOne
    @JoinColumn(name = "exame_idExame")
    private Exame exame;
    
    
    private boolean resultado;

    public ResultadoExame() {
        idResultadoExame = 0;
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

    public int getIdResultadoExame() {
        return idResultadoExame;
    }

    public void setIdResultadoExame(int idResultadoExame) {
        this.idResultadoExame = idResultadoExame;
    }

}
