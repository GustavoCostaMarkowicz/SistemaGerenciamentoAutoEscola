package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.RegraParcelas;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.List;

public class ControleRegraParcela {

    public void inserirRegraParcelas(RegraParcelas s) {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        regraparcelasDAO.salvar(s);

    }

    public void alterarRegraParcelas(RegraParcelas s) {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        regraparcelasDAO.alterar(s);

    }

    public void excluirRegraParcelas(RegraParcelas s) {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        regraparcelasDAO.excluir(s);

    }

    public List<RegraParcelas> buscarTodosRegraParcelass() {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        List<RegraParcelas> regraparcelass = regraparcelasDAO.buscarTodos(RegraParcelas.class);
        return regraparcelass;

    }

//    public RegraParcelas buscarRegraParcelasPorServico(Servico servico) {
//
//        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
//        RegraParcelas s = regraparcelasDAO.buscarPorId(nome);
//        return s;
//
//    }

}
