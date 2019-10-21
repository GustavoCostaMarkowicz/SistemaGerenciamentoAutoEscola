package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

@Entity(name = "registro")
public class Registro implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idRegistro;

    @Temporal(TemporalType.DATE)
    private Date dataRegistro;

    @Temporal(TemporalType.TIME)
    private Date horarioRegistro;

    @Column(name = "textoregistro", nullable = false, length = 150)
    private String textoRegistro;
    
    @Column(name = "justificativa", nullable = true, length = 500)
    private String justificativa;
    
    @Type(type = "true_false")
    @Column(name = "valido", nullable = true)
    private boolean valido;
    
    @Type(type = "true_false")
    @Column(name = "invalidavel", nullable = true)
    private boolean invalidavel;

    @ManyToOne
    @JoinColumn(name = "conta_Aluno")
    private Conta conta;

    @ManyToOne
    private Usuario usuario;

    public Registro() {
        idRegistro = 0;
        dataRegistro = new Date();
        horarioRegistro = new Date();
        textoRegistro = "";
        justificativa = "";
        valido = true;
        invalidavel = true;
        conta = new Conta();
        usuario = new Usuario();
    }

    public Registro(int idRegistro, Date dataRegistro, Date horarioRegistro, String textoRegistro, String justificativa, boolean valido, boolean invalidavel, Conta conta, Usuario usuario) {
        this.idRegistro = idRegistro;
        this.dataRegistro = dataRegistro;
        this.horarioRegistro = horarioRegistro;
        this.textoRegistro = textoRegistro;
        this.justificativa = justificativa;
        this.valido = valido;
        this.invalidavel = invalidavel;
        this.conta = conta;
        this.usuario = usuario;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public Date getDataRegistro() {
        return dataRegistro;
    }

    public void setDataRegistro(Date dataRegistro) {
        this.dataRegistro = dataRegistro;
    }

    public Date getHorarioRegistro() {
        return horarioRegistro;
    }

    public void setHorarioRegistro(Date horarioRegistro) {
        this.horarioRegistro = horarioRegistro;
    }

    public String getTextoRegistro() {
        return textoRegistro;
    }

    public void setTextoRegistro(String textoRegistro) {
        this.textoRegistro = textoRegistro;
    }

    public Conta getConta() {
        return conta;
    }

    public void setConta(Conta conta) {
        this.conta = conta;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public boolean isValido() {
        return valido;
    }

    public void setValido(boolean valido) {
        this.valido = valido;
    }

    public boolean isInvalidavel() {
        return invalidavel;
    }

    public void setInvalidavel(boolean invalidavel) {
        this.invalidavel = invalidavel;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }

}
