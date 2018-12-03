
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.Registro;
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
        Conta c = contaDAO.buscarPorId(idConta);
        return c;
        
    }
    
    public List<Registro> buscarRegistrosConta(int idConta){
        
        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        List<Registro> registros = registroDAO.buscarTodos(Registro.class);
        
        List<Registro> retorno = new ArrayList();
        for(Registro r: registros){
            if(r.getConta().getAluno().getIdPessoa() == idConta){
                retorno.add(r);
            }
        }
        
        return retorno;
        
    }
    
}
