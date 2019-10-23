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
    
    @Column(name = "tipoExameMedico", nullable = false, length = 50)
    private String tipoExameMedico;

    public ExameMedico() {
        medico = "";
        clinica = "";
        tipoExameMedico = "";
    }

    public ExameMedico(String medico, String clinica, String tipoExameMedico) {
        this.medico = medico;
        this.clinica = clinica;
        this.tipoExameMedico = tipoExameMedico;
    }

    public ExameMedico(String medico, String clinica, String tipoExameMedico, int idExame, Date dataExame, Date horarioExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        super(idExame, dataExame, horarioExame, maximoAlunos, reteste, alunos);
        this.medico = medico;
        this.clinica = clinica;
        this.tipoExameMedico = tipoExameMedico;
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

    public String getTipoExameMedico() {
        return tipoExameMedico;
    }

    public void setTipoExameMedico(String tipoExameMedico) {
        this.tipoExameMedico = tipoExameMedico;
    }

}
