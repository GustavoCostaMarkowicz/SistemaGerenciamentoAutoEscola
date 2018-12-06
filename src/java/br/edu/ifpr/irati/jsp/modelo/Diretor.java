package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "diretor")
@PrimaryKeyJoinColumn(name = "idUsuario")
public class Diretor extends Usuario implements Serializable {

    @Column(name = "cnpj", nullable = false, length = 18)
    private String cnpj;

    public Diretor() {
        super();
        cnpj = "";
    }

    public Diretor(String cnpj, int idUsuario, String login, String senha, String cidadeAtuacao, boolean visivel) {
        super(idUsuario, login, senha, cidadeAtuacao, visivel);
        this.cnpj = cnpj;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

}
//Método buscar por Id - Criação de listas em hibernate - Buscar em classes não mapeadas