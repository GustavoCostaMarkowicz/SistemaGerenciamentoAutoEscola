package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.List;

public class ControleServico {

    public void inserirServico(Servico s) {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        servicoDAO.salvar(s);

    }

    public void alterarServico(Servico s) {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        servicoDAO.alterar(s);

    }

    public void excluirServico(Servico s) {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        servicoDAO.excluir(s);

    }

    public List<Servico> buscarTodosServicos() {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        List<Servico> servicos = servicoDAO.buscarTodos(Servico.class);
        return servicos;

    }

    public Servico buscarServicoPorNome(String nome) {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        Servico s = servicoDAO.buscarPorId(nome);
        return s;

    }

}
