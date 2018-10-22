package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import org.hibernate.annotations.Type;

@Entity(name = "usuario")
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idUsuario;
    
    @Column(name = "login", nullable = false, length = 50)
    protected String login;
    
    @Column(name = "senha", nullable = false, length = 300)
    protected String senha;
    
    @Column(name = "cidadeatuacao", nullable = false, length = 50)
    protected String cidadeAtuacao;
    
    @Type(type = "true_false")
    @Column(name = "visivel", nullable = true)
    protected boolean visivel;

    public Usuario() {
        idUsuario = 0;
        login = "";
        senha = "";
        cidadeAtuacao = "";
        visivel = true;
    }

    public Usuario(int idUsuario, String login, String senha, String cidadeAtuacao) {
        this.idUsuario = idUsuario;
        this.login = login;
        this.senha = senha;
        this.cidadeAtuacao = cidadeAtuacao;
        this.visivel = true;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCidadeAtuacao() {
        return cidadeAtuacao;
    }

    public void setCidadeAtuacao(String cidadeAtuacao) {
        this.cidadeAtuacao = cidadeAtuacao;
    }

    public boolean isVisivel() {
        return visivel;
    }

    public void setVisivel(boolean visivel) {
        this.visivel = visivel;
    }

}
