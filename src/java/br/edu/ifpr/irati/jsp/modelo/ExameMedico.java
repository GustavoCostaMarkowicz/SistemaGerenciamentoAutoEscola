package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "examemedico")
@PrimaryKeyJoinColumn(name = "idExame")
public class ExameMedico extends Exame implements Serializable {

    @Column(name = "medico", nullable = true, length = 50)
    private String medico;

    @Column(name = "clinica", nullable = false, length = 50)
    private String clinica;

    public ExameMedico() {
        medico = "";
        clinica = "";
    }

    public ExameMedico(String medico, String clinica, int idExame, Date dataExame, Date horarioExame, List<ResultadoExame> resultadoExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, resultadoExame, maximoAlunos, reteste, alunos);
        this.medico = medico;
        this.clinica = clinica;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public String getClinica() {
        return clinica;
    }

    public void setClinica(String clinica) {
        this.clinica = clinica;
    }

}
