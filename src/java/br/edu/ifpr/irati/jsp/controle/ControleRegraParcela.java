package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.RegraParcelas;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.ArrayList;
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

    public List<RegraParcelas> buscarTodosRegraParcelas() {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        List<RegraParcelas> regraparcelas = regraparcelasDAO.buscarTodos(RegraParcelas.class);
        return regraparcelas;

    }

    public List<RegraParcelas> buscarRegraParcelasPorServico(Servico servico) {

        Dao<RegraParcelas> regraparcelasDAO = new GenericDAO<>(RegraParcelas.class);
        List<RegraParcelas> regraparcelas = regraparcelasDAO.buscarTodos(RegraParcelas.class);
        List<RegraParcelas> regraparcelass = new ArrayList();
        for(RegraParcelas rp: regraparcelas){
            if(rp.getServico().getTipoServico().equals(servico.getTipoServico())){
                regraparcelass.add(rp);
            }
        }
        return regraparcelass;

    }

}
