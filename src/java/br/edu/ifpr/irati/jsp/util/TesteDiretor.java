package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Diretor;
import java.util.List;

public class TesteDiretor {

    public static void main(String[] args) {

        Dao<Diretor> diretorDAO = new GenericDAO<>(Diretor.class);

        Diretor d = new Diretor("1111", 0, "diretor1", "dir1senha", "Irati", true);

        diretorDAO.salvar(d);
        
        List<Diretor> diretores = diretorDAO.buscarTodos(Diretor.class);
        for (Diretor diretor : diretores) {
            System.out.println(diretor.getLogin());
        }

        System.exit(0);

    }

}
