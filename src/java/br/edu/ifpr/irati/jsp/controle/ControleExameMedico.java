
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    
    public List<ExameMedico> buscarExameMedPorIdAluno(int idAluno){
        
        Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);
        List<ExameMedico> examemedicos = new ArrayList<>();
        examemedicos = examemedicoDAO.buscarTodos(ExameMedico.class);
        ControleAluno ca = new ControleAluno();
        Aluno a = ca.buscarAlunosPorId(idAluno);
        List<ExameMedico> ems = new ArrayList<>();
        
        
        
        
        for(ExameMedico e : examemedicos){
            
            for(int i = 0; i < e.getMaximoAlunos(); i++){
            if(e.getAlunos().get(i).getIdPessoa() == a.getIdPessoa()){  
               ems.add(e); 
            }
            }
        }
        
        return ems;
        
    }
    
    public List<ExameMedico> buscarExamePorData(Date dataExame){
            
            SimpleDateFormat sdf = new SimpleDateFormat();
            
            ControleExameMedico cem = new ControleExameMedico();
            List<ExameMedico> tems = cem.buscarTodosExameMedicos();
            List<ExameMedico> ems = new ArrayList();
            System.out.println("AAAAAAAAAAAAAAAA" + dataExame);
            System.out.println("DIA: " + dataExame.getDate());
            System.out.println("MÊS: " + dataExame.getMonth());
            int ano = dataExame.getYear();
            System.out.println("ANO: " + ano);
            
            
            for (ExameMedico e : tems) {
                System.out.println("DIA EX: " + e.getDataExame().getDate());
                System.out.println("MÊS EX: " + e.getDataExame().getMonth());
                System.out.println("ANO EX: " + e.getDataExame().getYear());
            
                if (e.getDataExame().getDate() == dataExame.getDate() & e.getDataExame().getMonth() == dataExame.getMonth() & e.getDataExame().getYear() == ano) {
                    ems.add(e);
                }
            }
            return ems;
        
    }
    
}
