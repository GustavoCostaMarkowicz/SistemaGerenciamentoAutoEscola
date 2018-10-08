
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import java.util.ArrayList;
import java.util.List;

public class ControleExamePratico {
    
    
     public void inserirExamePratico(ExamePratico em){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        examepraticoDAO.salvar(em);
        
    }
    
    public void alterarExamePratico(ExamePratico em){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        examepraticoDAO.alterar(em);
        
    }
    
    public void excluirExamePratico(ExamePratico em){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        examepraticoDAO.excluir(em);
        
    }
    
    
    public List<ExamePratico> buscarTodosExamePraticos(){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        List<ExamePratico> examepraticos = new ArrayList<>();
        examepraticos = examepraticoDAO.buscarTodos(ExamePratico.class);
        return examepraticos;
        
    }
    
    public ExamePratico buscarExamePraticosPorId(int idExamePratico){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        ExamePratico em = examepraticoDAO.buscarPorId(idExamePratico);
        return em;
        
    }
    
}


