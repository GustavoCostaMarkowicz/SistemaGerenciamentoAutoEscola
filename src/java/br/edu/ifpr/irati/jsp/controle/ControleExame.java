
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import java.util.ArrayList;
import java.util.Date;
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
    
    public List<Exame> buscarExamesPorData(String data1, String data2){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        List<Exame> es = exameDAO.buscarExamesPorData(data1, data2);
        return es;
        
    }
    
    public String verificarTipoExame(int idExame) {

        Dao<ExamePratico> exameDAO = new GenericDAO<>(ExamePratico.class);

        List<ExamePratico> exames = exameDAO.buscarTodos(ExamePratico.class);

        String tipoExame = "";

        for (ExamePratico ep : exames) {
            if (ep.getIdExame() == idExame) {
                tipoExame = "pratico";
            }
        }

        return tipoExame;

    }
    
}


