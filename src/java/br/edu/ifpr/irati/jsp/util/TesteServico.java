package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.List;

public class TesteServico {

    public static void main(String[] args) {

        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        
        Servico s = new Servico("Primeira Carteira A", 1300.00);
        
        servicoDAO.salvar(s);

        List<Servico> servicos = servicoDAO.buscarTodos(Servico.class);
        for (Servico servico : servicos) {
            System.out.println(servico.getTipoServico());
        }

        System.exit(0);

    }

}
