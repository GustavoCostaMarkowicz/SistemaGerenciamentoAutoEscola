
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import java.util.ArrayList;
import java.util.List;

public class ControleExameMedico {
    
     public void inserirExameMedico(ExameMedico em){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        examemedicoDAO.salvar(em);
        
    }
    
    public void alterarExameMedico(ExameMedico em){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        examemedicoDAO.alterar(em);
        
    }
    
    public void excluirExameMedico(ExameMedico em){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        examemedicoDAO.excluir(em);
        
    }
    
    
    public List<ExameMedico> buscarTodosExameMedicos(){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        List<ExameMedico> examemedicos = new ArrayList<>();
        examemedicos = examemedicoDAO.buscarTodos(ExameMedico.class);
        return examemedicos;
        
    }
    
    public ExameMedico buscarExameMedicosPorId(int idExameMedico){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        ExameMedico em = examemedicoDAO.buscarPorId(idExameMedico);
        return em;
        
    }
    
}
