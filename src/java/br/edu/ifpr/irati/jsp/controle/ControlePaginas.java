
package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ItemMenu;
import java.util.List;

public class ControlePaginas {
    
    private List<ItemMenu> itens;

    public ControlePaginas() {
        
        Dao<ItemMenu> itemMenuDAO = new GenericDAO<>(ItemMenu.class);
        
        itens = itemMenuDAO.buscarTodos(ItemMenu.class);
        
    }

    
   
    public List<ItemMenu> getItens() {
        return itens;
    }

    
}
