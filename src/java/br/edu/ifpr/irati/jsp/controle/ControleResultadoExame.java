
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ResultadoExame;
import java.util.ArrayList;
import java.util.List;

public class ControleResultadoExame {
    
    
     public void inserirResultadoExame(ResultadoExame em){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        resultadoexameDAO.salvar(em);
        
    }
    
    public void alterarResultadoExame(ResultadoExame em){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        resultadoexameDAO.alterar(em);
        
    }
    
    public void excluirResultadoExame(ResultadoExame em){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        resultadoexameDAO.excluir(em);
        
    }
    
    
    public List<ResultadoExame> buscarTodosResultadoExames(){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        List<ResultadoExame> resultadoexames = new ArrayList<>();
        resultadoexames = resultadoexameDAO.buscarTodos(ResultadoExame.class);
        return resultadoexames;
        
    }
    
    public ResultadoExame buscarResultadoExamesPorId(int idResultadoExame){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        ResultadoExame em = resultadoexameDAO.buscarPorId(idResultadoExame);
        return em;
        
    }
    
    public ResultadoExame buscarResultadoExamesPorAlunoExame(int idAluno, int idExame){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        ResultadoExame re = resultadoexameDAO.buscarResultadoExamesPorAlunoExame(idAluno, idExame);
        return re;
        
    }
    
    public List<ResultadoExame> buscarResultadoExamesPorExame(int idExame){
        
        Dao<ResultadoExame> resultadoexameDAO = new GenericDAO<>(ResultadoExame.class);
        List<ResultadoExame> re = resultadoexameDAO.buscarResultadoExamesPorExame(idExame);
        return re;
        
    }
    
}


