package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

@Entity(name = "exame")
@Inheritance(strategy = InheritanceType.JOINED)
public class Exame implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idExame;

    @Temporal(TemporalType.DATE)
    protected Date dataExame;

    @Temporal(TemporalType.TIME)
    protected Date horarioExame;

    @Column(name = "maximoalunos", nullable = false)
    protected int maximoAlunos;

    @Type(type = "true_false")
    @Column(name = "reteste", nullable = true)
    protected boolean reteste;

    @ManyToMany(fetch = FetchType.EAGER)
    protected List<Aluno> alunos;
    
    @OneToMany(mappedBy = "exame")
    protected List<ResultadoExame> resultadoExame;

    public Exame() {
        idExame = 0;
        dataExame = new Date();
        horarioExame = new Date();
        resultadoExame = new ArrayList<>();
        maximoAlunos = 0;
        reteste = false;
        alunos = new ArrayList<>();
    }
    
    public Exame(int idExame, Date dataExame, Date horarioExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        this.idExame = idExame;
        this.dataExame = dataExame;
        this.horarioExame = horarioExame;
        resultadoExame = new ArrayList<>();
        this.maximoAlunos = maximoAlunos;
        this.reteste = reteste;
        this.alunos = alunos;
    }

    public Exame(int idExame, Date dataExame, Date horarioExame, List<ResultadoExame> resultadoExame, int maximoAlunos, boolean reteste, List<Aluno> alunos) {
        this.idExame = idExame;
        this.dataExame = dataExame;
        this.horarioExame = horarioExame;
        this.resultadoExame = resultadoExame;
        this.maximoAlunos = maximoAlunos;
        this.reteste = reteste;
        this.alunos = alunos;
    }

    public int getIdExame() {
        return idExame;
    }

    public void setIdExame(int idExame) {
        this.idExame = idExame;
    }

    public Date getDataExame() {
        return dataExame;
    }

    public void setDataExame(Date dataExame) {
        this.dataExame = dataExame;
    }

    public Date getHorarioExame() {
        return horarioExame;
    }

    public void setHorarioExame(Date horarioExame) {
        this.horarioExame = horarioExame;
    }

    public List<ResultadoExame> isResultadoExame() {
        return resultadoExame;
    }

    public void setResultadoExame(List<ResultadoExame> resultadoExame) {
        this.resultadoExame = resultadoExame;
    }

    public int getMaximoAlunos() {
        return maximoAlunos;
    }

    public void setMaximoAlunos(int maximoAlunos) {
        this.maximoAlunos = maximoAlunos;
    }

    public boolean isReteste() {
        return reteste;
    }

    public void setReteste(boolean reteste) {
        this.reteste = reteste;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }

}
