package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "examepsicotecnico")
@PrimaryKeyJoinColumn(name = "idExame")
public class ExamePsicotecnico extends Exame implements Serializable {

    @Column(name = "psicologo", nullable = true, length = 50)
    private String psicologo;

    @Column(name = "clinica", nullable = false, length = 50)
    private String clinica;

    public ExamePsicotecnico() {
        super();
        psicologo = "";
        clinica = "";
    }
    
    public ExamePsicotecnico(String psicologo, String clinica, int idExame, Date dataExame, Date horarioExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, maximoAlunos, reteste, alunos);
        this.psicologo = psicologo;
        this.clinica = clinica;
    }

    public ExamePsicotecnico(String psicologo, String clinica, int idExame, Date dataExame, Date horarioExame, List<ResultadoExame> resultadoExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, resultadoExame, maximoAlunos, reteste, alunos);
        this.psicologo = psicologo;
        this.clinica = clinica;
    }

    public String getPsicologo() {
        return psicologo;
    }

    public void setPsicologo(String psicologo) {
        this.psicologo = psicologo;
    }

    public String getClinica() {
        return clinica;
    }

    public void setClinica(String clinica) {
        this.clinica = clinica;
    }

}
