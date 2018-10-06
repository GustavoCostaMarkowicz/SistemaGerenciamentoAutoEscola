package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Veiculo;
import java.util.List;

public class ControleVeiculo {

    public void inserirVeiculo(Veiculo v) {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
        veiculoDAO.salvar(v);

    }

    public void alterarVeiculo(Veiculo v) {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
        veiculoDAO.alterar(v);

    }

    public void excluirVeiculo(Veiculo v) {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
        veiculoDAO.excluir(v);

    }

    public List<Veiculo> buscarTodosVeiculos() {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
        List<Veiculo> veiculos = veiculoDAO.buscarTodos(Veiculo.class);
        return veiculos;

    }

    public Veiculo buscarVeiculosPorId(String placa) {

        Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
        Veiculo v = veiculoDAO.buscarPorId(placa);
        return v;

    }

}
