
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.ArrayList;
import java.util.List;

public class ControleServico {
    
    
    
    public Servico buscarServicoPorNome(String nomeServico){
        
        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        Servico s = servicoDAO.buscarPorId(nomeServico);
        return s;
        
    }

    public List<Servico> buscarTodosServicos(){
        
        List<Servico> servicos = new ArrayList<>();
        
        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
        
        servicos = servicoDAO.buscarTodos(Servico.class);
        
        return servicos;
        
    }
    
    
    
}
