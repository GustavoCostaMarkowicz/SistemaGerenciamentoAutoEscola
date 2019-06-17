
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.exception.dataIncorretaException;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
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
    
}


