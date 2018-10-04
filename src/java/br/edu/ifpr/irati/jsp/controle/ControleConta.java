
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import java.util.ArrayList;
import java.util.List;

public class ControleConta {
    
    public void inserirConta(Conta a){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        contaDAO.salvar(a);
        
    }
    
    public void alterarConta(Conta a){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        contaDAO.alterar(a);
        
    }
    
    public void excluirConta(Conta a){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        contaDAO.excluir(a);
        
    }
    
    
    public List<Conta> buscarTodosContas(){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        List<Conta> contas = new ArrayList<>();
        contas = contaDAO.buscarTodos(Conta.class);
        return contas;
        
    }
    
    public Conta buscarContasPorId(int idConta){
        
        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        Conta a = contaDAO.buscarPorId(idConta);
        return a;
        
    }
    
}
