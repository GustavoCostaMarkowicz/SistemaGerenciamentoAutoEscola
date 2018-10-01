package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteInstrutor {

    public static void main(String[] args) {

        try {
            Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);

            Instrutor i = new Instrutor(new Date(), "111222333", new SimpleDateFormat("dd/MM/yyyy").parse("30/08/2020"), "Prático/Teórico", "ativo", 0, "Nome Instrutor", new Date(), "Irati", "Paraná", null, null, null, "84500-000", null, "(42)3422-8080", null, "22.222.222-2", "222.222.222-22");

            instrutorDAO.salvar(i);
            
            List<Instrutor> instrutores = instrutorDAO.buscarTodos(Instrutor.class);
            for (Instrutor instrutor : instrutores) {
                System.out.println(instrutor.getNomeCompleto());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteInstrutor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
