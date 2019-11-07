
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Registro;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    
    public List<Registro> buscarRegistroPorData(Date dataRegistro){
        
        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);
        List<Registro> rtodos = registroDAO.buscarTodos(Registro.class);
        List<Registro> rdata = new ArrayList<>();
        
        for(Registro r: rtodos){
            
            if(dataRegistro.getDay() == r.getDataRegistro().getDay() & dataRegistro.getMonth() == r.getDataRegistro().getMonth() & dataRegistro.getYear() == r.getDataRegistro().getYear()){
                rdata.add(r);
            }
            
        }
        
        return rdata;
        
        
    }
    
}
