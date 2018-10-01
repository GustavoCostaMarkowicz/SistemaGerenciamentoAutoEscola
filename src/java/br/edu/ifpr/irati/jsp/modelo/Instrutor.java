package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "instrutor")
@PrimaryKeyJoinColumn(name = "idPessoa")
public class Instrutor extends Pessoa implements Serializable {

    @Temporal(TemporalType.DATE)
    private Date dataAdmissao;

    @Column(name = "numerolicencainstrutor", nullable = false, length = 50)
    private String numeroLicencaInstrutor;

    @Temporal(TemporalType.DATE)
    private Date dataValidadeLicenca;

    @Column(name = "tipoinstrucao", nullable = false, length = 50)
    private String tipoInstrucao;

    @Column(name = "situacao", nullable = true, length = 20)
    private String situacao;

    @OneToMany(mappedBy = "instrutor")
    private List<ExamePratico> examesPraticos;

    @OneToMany(mappedBy = "instrutor")
    private List<ExameTeorico> examesTeoricos;

    public Instrutor() {
        super();
        dataAdmissao = new Date();
        numeroLicencaInstrutor = "";
        dataValidadeLicenca = new Date();
        tipoInstrucao = "";
        situacao = "";
        examesPraticos = new ArrayList<>();
        examesTeoricos = new ArrayList<>();
    }

    public Instrutor(Date dataAdmissao, String numeroLicencaInstrutor, Date dataValidadeLicenca, String tipoInstrucao, String situacao, int idPessoa, String nomeCompleto, Date dataCadastro, String cidade, String estado, String endereco, String numero, String complemento, String cep, String bairro, String telefone, String telefoneCelular, String rg, String cpf) {
        super(idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
        this.dataAdmissao = dataAdmissao;
        this.numeroLicencaInstrutor = numeroLicencaInstrutor;
        this.dataValidadeLicenca = dataValidadeLicenca;
        this.tipoInstrucao = tipoInstrucao;
        this.situacao = situacao;
        examesPraticos = new ArrayList<>();
        examesTeoricos = new ArrayList<>();
    }

    public Instrutor(Date dataAdmissao, String numeroLicencaInstrutor, Date dataValidadeLicenca, String tipoInstrucao, String situacao, List<ExamePratico> examesPraticos, List<ExameTeorico> examesTeoricos, int idPessoa, String nomeCompleto, Date dataCadastro, String cidade, String estado, String endereco, String numero, String complemento, String cep, String bairro, String telefone, String telefoneCelular, String rg, String cpf) {
        super(idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
        this.dataAdmissao = dataAdmissao;
        this.numeroLicencaInstrutor = numeroLicencaInstrutor;
        this.dataValidadeLicenca = dataValidadeLicenca;
        this.tipoInstrucao = tipoInstrucao;
        this.situacao = situacao;
        this.examesPraticos = examesPraticos;
        this.examesTeoricos = examesTeoricos;
    }

    public Date getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public String getNumeroLicencaInstrutor() {
        return numeroLicencaInstrutor;
    }

    public void setNumeroLicencaInstrutor(String numeroLicencaInstrutor) {
        this.numeroLicencaInstrutor = numeroLicencaInstrutor;
    }

    public Date getDataValidadeLicenca() {
        return dataValidadeLicenca;
    }

    public void setDataValidadeLicenca(Date dataValidadeLicenca) {
        this.dataValidadeLicenca = dataValidadeLicenca;
    }

    public String getTipoInstrucao() {
        return tipoInstrucao;
    }

    public void setTipoInstrucao(String tipoInstrucao) {
        this.tipoInstrucao = tipoInstrucao;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public List<ExamePratico> getExamesPraticos() {
        return examesPraticos;
    }

    public void setExamesPraticos(List<ExamePratico> examesPraticos) {
        this.examesPraticos = examesPraticos;
    }

    public List<ExameTeorico> getExamesTeoricos() {
        return examesTeoricos;
    }

    public void setExamesTeoricos(List<ExameTeorico> examesTeoricos) {
        this.examesTeoricos = examesTeoricos;
    }

}
