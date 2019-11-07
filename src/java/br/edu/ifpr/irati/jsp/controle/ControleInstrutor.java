package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ControleInstrutor {

    public void inserirInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        instrutorDAO.salvar(i);

    }

    public void alterarInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        instrutorDAO.alterar(i);

    }

    public void excluirInstrutor(Instrutor i) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        i.setVisivel(false);
        instrutorDAO.alterar(i);

    }

    public List<Instrutor> buscarTodosInstrutores() {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        List<Instrutor> instrutores = instrutorDAO.buscarTodos(Instrutor.class);
        return instrutores;

    }

    public Instrutor buscarInstrutorPorId(int idPessoa) {

        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
        Instrutor i = instrutorDAO.buscarPorId(idPessoa);
        return i;

    }
    
    public List<Instrutor> buscarInstrutorExameDia(int dia, int mes, int ano){
        
        Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
       
        List<Instrutor> instrutores = instrutorDAO.buscarTodos(Instrutor.class);
      
        List<Instrutor> is = new ArrayList<>();
        
          
            ControleExamePratico cep = new ControleExamePratico();
            List<ExamePratico> tems = cep.buscarTodosExamePraticos();
            List<ExamePratico> eps = new ArrayList();
           
           
            
          
            
            
            for (ExamePratico e : tems) {
                
            
                if (e.getDataExame().getDay() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == ano) {
                    eps.add(e);
                }
            }
      
         for(ExamePratico ep : eps){
             for(Instrutor i : instrutores){
                 if (ep.getInstrutor().getIdPessoa() == i.getIdPessoa()) {
                     is.add(i);
                 }
             }
         }
        return is;
        
    }

}
