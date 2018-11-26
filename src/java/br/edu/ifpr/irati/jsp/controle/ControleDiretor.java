
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.exception.HashGenerationException;
import br.edu.ifpr.irati.jsp.modelo.Diretor;
import br.edu.ifpr.irati.jsp.util.Digest;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControleDiretor {
    
    public void salvarUsuario(Diretor d){
        
        try {
            d.setSenha(Digest.hashString(d.getSenha(), "SHA-512"));
            
            Dao<Diretor> aDAO = new GenericDAO<>(Diretor.class);
            
            aDAO.salvar(d);
            
            
        } catch (HashGenerationException ex) {
            Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
