
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico;
import java.util.ArrayList;
import java.util.List;

public class ControleExamePsicotecnico {
    
    
     public void inserirExamePsicotecnico(ExamePsicotecnico em){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        examepsicotecnicoDAO.salvar(em);
        
    }
    
    public void alterarExamePsicotecnico(ExamePsicotecnico em){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        examepsicotecnicoDAO.alterar(em);
        
    }
    
    public void excluirExamePsicotecnico(ExamePsicotecnico em){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        examepsicotecnicoDAO.excluir(em);
        
    }
    
    
    public List<ExamePsicotecnico> buscarTodosExamePsicotecnicos(){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        List<ExamePsicotecnico> examepsicotecnicos = new ArrayList<>();
        examepsicotecnicos = examepsicotecnicoDAO.buscarTodos(ExamePsicotecnico.class);
        return examepsicotecnicos;
        
    }
    
    public ExamePsicotecnico buscarExamePsicotecnicosPorId(int idExamePsicotecnico){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        ExamePsicotecnico em = examepsicotecnicoDAO.buscarPorId(idExamePsicotecnico);
        return em;
        
    }
    
     public List<ExamePsicotecnico> buscarExamePsicoPorIdAluno(int idAluno){
        
        Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);
        List<ExamePsicotecnico> examepsicotecnicos = new ArrayList<>();
        examepsicotecnicos = examepsicotecnicoDAO.buscarTodos(ExamePsicotecnico.class);
        ControleAluno ca = new ControleAluno();
        Aluno a = ca.buscarAlunosPorId(idAluno);
        List<ExamePsicotecnico> ems = new ArrayList<>();
        
        
        
        
        for(ExamePsicotecnico e : examepsicotecnicos){
            
            for(int i = 0; i < e.getMaximoAlunos(); i++){
            if(e.getAlunos().get(i).getIdPessoa() == a.getIdPessoa()){  
               ems.add(e); 
            }
            }
        }
        
        return ems;
        
    }
    
}


