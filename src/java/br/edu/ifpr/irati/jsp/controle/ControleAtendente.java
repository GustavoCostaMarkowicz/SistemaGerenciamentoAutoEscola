package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.Atendente;
import java.util.List;

public class ControleAtendente {

    public void inserirAtendente(Atendente a) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        atendenteDAO.salvar(a);

    }

    public void alterarAtendente(Atendente a) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        atendenteDAO.alterar(a);

    }

    public void excluirAtendente(Atendente a) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        atendenteDAO.excluir(a);

    }

    public List<Atendente> buscarTodosAtendentes() {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        List<Atendente> atendentes = atendenteDAO.buscarTodos(Atendente.class);
        return atendentes;

    }

    public Atendente buscarAtendentePorId(int idPessoa) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        Atendente a = atendenteDAO.buscarPorId(idPessoa);
        return a;

    }

}
