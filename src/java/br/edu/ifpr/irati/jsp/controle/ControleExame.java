
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import java.util.ArrayList;
import java.util.List;

public class ControleExame {
    
    
     public void inserirExame(Exame em){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        exameDAO.salvar(em);
        
    }
    
    public void alterarExame(Exame em){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        exameDAO.alterar(em);
        
    }
    
    public void excluirExame(Exame em){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        exameDAO.excluir(em);
        
    }
    
    
    public List<Exame> buscarTodosExames(){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        List<Exame> exames = new ArrayList<>();
        exames = exameDAO.buscarTodos(Exame.class);
        return exames;
        
    }
    
    public Exame buscarExamesPorId(int idExame){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        Exame em = exameDAO.buscarPorId(idExame);
        return em;
        
    }
    
    
    
}


