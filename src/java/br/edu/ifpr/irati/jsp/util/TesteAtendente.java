package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.controle.ControleUsuario;
import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Atendente;
import java.util.List;

public class TesteAtendente {

    public static void main(String[] args) {

       

        Atendente a = new Atendente("Nome do Atendente", "(42)99900-8888", "null", 0, "atendente1", "atd1senha", "Irati");

        ControleUsuario cu = new ControleUsuario();
        cu.salvarUsuario(a);
        
        

        System.exit(0);

    }

}
