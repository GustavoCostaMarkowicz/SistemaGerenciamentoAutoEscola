package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import java.util.List;

public class ControleInstrutor {

    public void inserirInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        instrutorDAO.salvar(i);

    }

    public void alterarInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        instrutorDAO.alterar(i);

    }

    public void excluirInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        instrutorDAO.excluir(i);

    }

    public List<Instrutor> buscarTodosInstrutores() {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        List<Instrutor> instrutores = instrutorDAO.buscarTodos(Instrutor.class);
        return instrutores;

    }

    public Instrutor buscarInstrutorPorId(int idPessoa) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        Instrutor i = instrutorDAO.buscarPorId(idPessoa);
        return i;

    }

}
