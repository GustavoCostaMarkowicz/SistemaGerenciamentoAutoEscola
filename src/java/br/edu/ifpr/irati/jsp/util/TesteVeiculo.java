package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Veiculo;
import java.util.List;

public class TesteVeiculo {

    public static void main(String[] args) {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);

        Veiculo v = new Veiculo("ABC-1234", "Chevrolet", "Onix", "2015");
        
        veiculoDAO.salvar(v);

        List<Veiculo> veiculos = veiculoDAO.buscarTodos(Veiculo.class);
        for (Veiculo veiculo : veiculos) {
            System.out.println(veiculo.getPlaca());
        }

        System.exit(0);

    }

}
