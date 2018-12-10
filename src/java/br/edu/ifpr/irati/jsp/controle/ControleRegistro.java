
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Registro;

public class ControleRegistro {
    
    public void inserirRegitro(Registro r){
        
        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        registroDAO.salvar(r);
        
    }
    
    public void alterarRegistro(Registro r) {

        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        registroDAO.alterar(r);

    }
    
    public void excluirRegistro(Registro r){
        
        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        registroDAO.excluir(r);
        
    }
    
    public Registro buscarRegistroPorId(int idRegistro) {

        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        Registro r = registroDAO.buscarPorId(idRegistro);
        return r;

    }
    
}
