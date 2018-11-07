package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.ItemMenu;
import java.util.List;

public class ControleItemMenu {

    public void inserirItemMenu(ItemMenu im) {

        Dao<ItemMenu> itemMenuDAO = new GenericDAO<>(ItemMenu.class);
        itemMenuDAO.salvar(im);

    }

    public void alterarItemMenu(ItemMenu im) {

        Dao<ItemMenu> itemMenuDAO = new GenericDAO<>(ItemMenu.class);
        itemMenuDAO.alterar(im);

    }

    public void excluirItemMenu(ItemMenu im) {

        Dao<ItemMenu> itemMenuDAO = new GenericDAO<>(ItemMenu.class);
        itemMenuDAO.excluir(im);

    }

    public List<ItemMenu> buscarTodosItensMenu() {

        Dao<ItemMenu> itemMenuDAO = new GenericDAO<>(ItemMenu.class);
        List<ItemMenu> itensmenu = itemMenuDAO.buscarTodos(ItemMenu.class);
        return itensmenu;

    }

}
