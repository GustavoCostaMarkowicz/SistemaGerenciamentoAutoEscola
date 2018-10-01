
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import java.util.ArrayList;
import java.util.List;

public class ControleAluno {
    
     public void inserirAluno(Aluno a){
        
        Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
        alunoDAO.salvar(a);
        
    }
    
    public void alterarAluno(Aluno a){
        
        Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
        alunoDAO.alterar(a);
        
    }
    
    public void excluirAluno(Aluno a){
        
        Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
        alunoDAO.excluir(a);
        
    }
    
    
    public List<Aluno> buscarTodosAlunos(){
        
        Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
        List<Aluno> alunos = new ArrayList<>();
        alunos = alunoDAO.buscarTodos(Aluno.class);
        return alunos;
        
    }
    
    public Aluno buscarAlunosPorId(int idAluno){
        
        Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
        Aluno a = alunoDAO.buscarPorId(idAluno);
        return a;
        
    }
    
    
}
