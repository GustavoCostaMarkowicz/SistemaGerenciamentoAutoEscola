
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.exception.dataIncorretaException;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public List<ExamePratico> buscarExamesPraticosPorData(String sdata) throws dataIncorretaException{
        
         try {
             SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
             String date = sdata;
             System.err.println(date);
             Date data = sdf.parse(sdata);
             
             Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
             List<ExamePratico> examepraticos = new ArrayList<>();
             examepraticos = examepraticoDAO.buscarTodos(ExamePratico.class);
             List<ExamePratico> epdata = new ArrayList<>();
             
             for (ExamePratico ep : examepraticos) {
                 Date dataex = ep.getDataExame();
                 
                 if (data == dataex) {
                     epdata.add(ep);
                 }
                 
             }
             
        
         return epdata;
             
         } catch (ParseException ex) {
             throw new dataIncorretaException("Data Inválida!");
         }
         
       
    }
    
     public List<ExamePratico> buscarExamePraticoPorIdAluno(int idAluno){
        
        Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);
        List<ExamePratico> examepraticos = new ArrayList<>();
        examepraticos = examepraticoDAO.buscarTodos(ExamePratico.class);
        ControleAluno ca = new ControleAluno();
        Aluno a = ca.buscarAlunosPorId(idAluno);
        List<ExamePratico> eps = new ArrayList<>();
        
        
        
        
        for(ExamePratico e : examepraticos){
            
            for(int i = 0; i < e.getMaximoAlunos(); i++){
            if(e.getAlunos().get(i).getIdPessoa() == a.getIdPessoa()){  
               eps.add(e); 
            }
            }
        }
        
        return eps;
        
    }
     
     public List<ExamePratico> buscarExamePraticoPorInstrutorEData(int idInstrutor, String dataEscolhida){
         
         ControleExamePratico cep = new ControleExamePratico();
         List<ExamePratico> eps = cep.buscarTodosExamePraticos();
         List<ExamePratico> listaExameData = new ArrayList<>();
         List<ExamePratico> listaExameInstrutorData = new ArrayList<>();
         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        
         
         for(ExamePratico ep : eps){
            
             String datas = sdf.format(ep.getDataExame()); 
             if(datas.equals(dataEscolhida)){
                 listaExameData.add(ep);
             }
             
         }
         
         
         if(listaExameData.size() != 0){
         for(ExamePratico ep : listaExameData){
             if (ep.getInstrutor().getIdPessoa() == idInstrutor) {
                 listaExameInstrutorData.add(ep);
             }
         }
         } else {
             return null;
         }
         
         if (listaExameInstrutorData.size() != 0) {
  
         return listaExameInstrutorData;
         
         } else {
             return null;
         }
     }
    
}


