package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "pessoa")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Pessoa implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idPessoa;

    @Column(name = "nomecompleto", nullable = false, length = 100)
    protected String nomeCompleto;

    @Temporal(TemporalType.DATE)
    protected Date dataCadastro;

    @Column(name = "cidade", nullable = true, length = 50)
    protected String cidade;

    @Column(name = "estado", nullable = true, length = 30)
    protected String estado;

    @Column(name = "endereco", nullable = true, length = 120)
    protected String endereco;

    @Column(name = "numero", nullable = true, length = 6)
    protected String numero;

    @Column(name = "complemento", nullable = true, length = 20)
    protected String complemento;

    @Column(name = "cep", nullable = true, length = 9)
    protected String cep;

    @Column(name = "bairro", nullable = true, length = 50)
    protected String bairro;

    @Column(name = "telefone", nullable = true, length = 14)
    protected String telefone;

    @Column(name = "telefonecelular", nullable = true, length = 15)
    protected String telefoneCelular;

    @Column(name = "rg", nullable = false, length = 14)
    protected String rg;

    @Column(name = "cpf", nullable = false, length = 14)
    protected String cpf;

    public Pessoa() {
        idPessoa = 0;
        nomeCompleto = "";
        dataCadastro = new Date();
        cidade = "";
        estado = "";
        endereco = "";
        numero = "";
        complemento = "";
        cep = "";
        bairro = "";
        telefone = "";
        telefone = "";
        rg = "";
        cpf = "";
    }

    public Pessoa(int idPessoa, String nomeCompleto, Date dataCadastro, String cidade, String estado, String endereco, String numero, String complemento, String cep, String bairro, String telefone, String telefoneCelular, String rg, String cpf) {
        this.idPessoa = idPessoa;
        this.nomeCompleto = nomeCompleto;
        this.dataCadastro = dataCadastro;
        this.cidade = cidade;
        this.estado = estado;
        this.endereco = endereco;
        this.numero = numero;
        this.complemento = complemento;
        this.cep = cep;
        this.bairro = bairro;
        this.telefone = telefone;
        this.telefoneCelular = telefoneCelular;
        this.rg = rg;
        this.cpf = cpf;
    }

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getTelefoneCelular() {
        return telefoneCelular;
    }

    public void setTelefoneCelular(String telefoneCelular) {
        this.telefoneCelular = telefoneCelular;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

}
