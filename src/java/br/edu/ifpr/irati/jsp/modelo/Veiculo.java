package br.edu.ifpr.irati.jsp.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Type;

@Entity(name = "veiculo")
public class Veiculo implements Serializable {

    @Id
    @Column(name = "placa", nullable = false, length = 8)
    private String placa;

    @Column(name = "marca", nullable = false, length = 50)
    private String marca;

    @Column(name = "modelo", nullable = false, length = 50)
    private String modelo;

    @Column(name = "anofabricacao", nullable = false, length = 4)
    private String anoFabricacao;

    @OneToMany(mappedBy = "veiculo")
    private List<ExamePratico> examesPraticos;
    
    @Type(type = "true_false")
    @Column(name = "visivel", nullable = true)
    private boolean visivel;

    public Veiculo() {
        placa = "";
        marca = "";
        modelo = "";
        anoFabricacao = "";
        examesPraticos = new ArrayList<>();
        visivel = true;
    }

    public Veiculo(String placa, String marca, String modelo, String anoFabricacao) {
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.anoFabricacao = anoFabricacao;
        this.visivel = true;
        examesPraticos = new ArrayList<>();
    }

    public Veiculo(String placa, String marca, String modelo, String anoFabricacao, List<ExamePratico> examesPraticos) {
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.anoFabricacao = anoFabricacao;
        this.visivel = true;
        this.examesPraticos = examesPraticos;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getAnoFabricacao() {
        return anoFabricacao;
    }

    public void setAnoFabricacao(String anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }

    public List<ExamePratico> getExamesPraticos() {
        return examesPraticos;
    }

    public void setExamesPraticos(List<ExamePratico> examesPraticos) {
        this.examesPraticos = examesPraticos;
    }

    public boolean isVisivel() {
        return visivel;
    }

    public void setVisivel(boolean visivel) {
        this.visivel = visivel;
    }

}
