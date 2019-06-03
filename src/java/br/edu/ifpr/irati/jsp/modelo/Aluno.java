package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

@Entity(name = "aluno")
@PrimaryKeyJoinColumn(name = "idPessoa")
public class Aluno extends Pessoa implements Serializable {
    
    @Column(name = "processo", nullable = false, length = 50)
    private String processo;
    
    @Column(name = "orgaorg", nullable = false, length = 50)
    private String orgaoRg;

    @Column(name = "uf", nullable = false, length = 2)
    private String uf;

    @Column(name = "estadocivil", nullable = true, length = 40)
    private String estadoCivil;

    @Column(name = "nomepai", nullable = false, length = 100)
    private String nomePai;

    @Column(name = "nomemae", nullable = false, length = 100)
    private String nomeMae;

    @Temporal(TemporalType.DATE)
    private Date dataNascimento;

    @Column(name = "naturalidade", nullable = false, length = 50)
    private String naturalidade;

    @Column(name = "nacionalidade", nullable = false, length = 50)
    private String nacionalidade;

    @Column(name = "sexo", nullable = false, length = 10)
    private String sexo;

    @Column(name = "grauinstrucao", nullable = true, length = 30)
    private String grauInstrucao;

    @Type(type = "true_false")
    @Column(name = "doadororgaos", nullable = true)
    private boolean doadorOrgaos;

    @Column(name = "tiposanguineo", nullable = true, length = 3)
    private String tipoSanguineo;

    @Column(name = "email", nullable = true, length = 120)
    private String email;

    @ManyToMany(mappedBy = "alunos", fetch = FetchType.EAGER)
    private List<Exame> exames;

    @OneToMany(mappedBy = "aluno", fetch = FetchType.EAGER)
    private List<ResultadoExame> examesAprovado;

    public Aluno() {
        processo = "";
        orgaoRg = "";
        uf = "";
        estadoCivil = "";
        nomePai = "";
        nomeMae = "";
        dataNascimento = new Date();
        naturalidade = "";
        nacionalidade = "";
        sexo = "";
        grauInstrucao = "";
        doadorOrgaos = false;
        tipoSanguineo = "";
        email = "";
        exames = new ArrayList<>();
        examesAprovado = new ArrayList<>();
    }

    public Aluno(String processo, String orgaoRg, String uf, String estadoCivil, String nomePai, String nomeMae, Date dataNascimento, String naturalidade, String nacionalidade, String sexo, String grauInstrucao, boolean doadorOrgaos, String tipoSanguineo, String email, int idPessoa, String nomeCompleto, Date dataCadastro, String cidade, String estado, String endereco, String numero, String complemento, String cep, String bairro, String telefone, String telefoneCelular, String rg, String cpf) {
        super(idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
        this.processo = processo;
        this.orgaoRg = orgaoRg;
        this.uf = uf;
        this.estadoCivil = estadoCivil;
        this.nomePai = nomePai;
        this.nomeMae = nomeMae;
        this.dataNascimento = dataNascimento;
        this.naturalidade = naturalidade;
        this.nacionalidade = nacionalidade;
        this.sexo = sexo;
        this.grauInstrucao = grauInstrucao;
        this.doadorOrgaos = doadorOrgaos;
        this.tipoSanguineo = tipoSanguineo;
        this.email = email;
        exames = new ArrayList<>();
        examesAprovado = new ArrayList<>();
    }

    public Aluno(String processo, String orgaoRg, String uf, String estadoCivil, String nomePai, String nomeMae, Date dataNascimento, String naturalidade, String nacionalidade, String sexo, String grauInstrucao, boolean doadorOrgaos, String tipoSanguineo, String email, List<Exame> exames, List<ResultadoExame> examesAprovado, int idPessoa, String nomeCompleto, Date dataCadastro, String cidade, String estado, String endereco, String numero, String complemento, String cep, String bairro, String telefone, String telefoneCelular, String rg, String cpf) {
        super(idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
        this.processo = processo;
        this.orgaoRg = orgaoRg;
        this.uf = uf;
        this.estadoCivil = estadoCivil;
        this.nomePai = nomePai;
        this.nomeMae = nomeMae;
        this.dataNascimento = dataNascimento;
        this.naturalidade = naturalidade;
        this.nacionalidade = nacionalidade;
        this.sexo = sexo;
        this.grauInstrucao = grauInstrucao;
        this.doadorOrgaos = doadorOrgaos;
        this.tipoSanguineo = tipoSanguineo;
        this.email = email;
        this.exames = exames;
        this.examesAprovado = examesAprovado;
    }

    public String getProcesso() {
        return processo;
    }

    public void setProcesso(String processo) {
        this.processo = processo;
    }
    
    public String getOrgaoRg() {
        return orgaoRg;
    }

    public void setOrgaoRg(String orgaoRg) {
        this.orgaoRg = orgaoRg;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getNomePai() {
        return nomePai;
    }

    public void setNomePai(String nomePai) {
        this.nomePai = nomePai;
    }

    public String getNomeMae() {
        return nomeMae;
    }

    public void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getNaturalidade() {
        return naturalidade;
    }

    public void setNaturalidade(String naturalidade) {
        this.naturalidade = naturalidade;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getGrauInstrucao() {
        return grauInstrucao;
    }

    public void setGrauInstrucao(String grauInstrucao) {
        this.grauInstrucao = grauInstrucao;
    }

    public boolean isDoadorOrgaos() {
        return doadorOrgaos;
    }

    public void setDoadorOrgaos(boolean doadorOrgaos) {
        this.doadorOrgaos = doadorOrgaos;
    }

    public String getTipoSanguineo() {
        return tipoSanguineo;
    }

    public void setTipoSanguineo(String tipoSanguineo) {
        this.tipoSanguineo = tipoSanguineo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Exame> getExames() {
        return exames;
    }

    public void setExames(List<Exame> exames) {
        this.exames = exames;
    }

    public List<ResultadoExame> getExamesAprovado() {
        return examesAprovado;
    }

    public void setExamesAprovado(List<ResultadoExame> examesAprovado) {
        this.examesAprovado = examesAprovado;
    }

}
