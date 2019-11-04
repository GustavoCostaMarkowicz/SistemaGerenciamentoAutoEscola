
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.Exame;
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
    
    public Conta buscarContaAluno(int idAluno){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        List<Conta> contas = contaDAO.buscarTodos(Conta.class);
        
        for(Conta conta: contas){
            if(conta.getAluno().getIdPessoa() == idAluno){
                return conta;
            }
        }
        
        return null;
        
    }
    
    public List<Exame> buscarExamesPorAluno(int idAluno){
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        
        List<Exame> exames = exameDAO.buscarExamesPorAluno(idAluno);
        
        return exames;
    }
    
    public List<Aluno> buscarAlunoComExamePendente(){
        
        
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);
        List<Exame> todose = exameDAO.buscarTodos(Exame.class);
        List<Exame> visiveis = new ArrayList<>();
        List<Aluno> alunos = new ArrayList<>();
        
        for(Exame e: todose){
            
            if(e.isVisivel()){
                alunos.add((Aluno) e.getAlunos());
            }
            
        }
        
        return alunos;
        
    }
    
}
