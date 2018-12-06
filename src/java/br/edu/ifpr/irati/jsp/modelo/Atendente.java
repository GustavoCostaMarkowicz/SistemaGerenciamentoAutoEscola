package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Type;

@Entity(name = "atendente")
@PrimaryKeyJoinColumn(name = "idUsuario")
public class Atendente extends Usuario implements Serializable {

    @Column(name = "nomecompleto", nullable = false, length = 100)
    private String nomeCompleto;

    @Column(name = "telefone", nullable = true, length = 14)
    private String telefone;

    @Column(name = "telefonecelular", nullable = true, length = 15)
    private String telefoneCelular;
    
   

    public Atendente() {
        super();
        nomeCompleto = "";
        telefone = "";
        telefoneCelular = "";
    }

    public Atendente(String nomeCompleto, String telefone, String telefoneCelular, int idUsuario, String login, String senha, String cidadeAtuacao, boolean visivel) {
        super(idUsuario, login, senha, cidadeAtuacao, visivel);
        this.nomeCompleto = nomeCompleto;
        this.telefone = telefone;
        this.telefoneCelular = telefoneCelular;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
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


}
