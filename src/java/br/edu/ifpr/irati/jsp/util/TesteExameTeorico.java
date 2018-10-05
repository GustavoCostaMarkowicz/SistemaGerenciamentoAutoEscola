package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExameTeorico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteExameTeorico {

    public static void main(String[] args) {

        try {
            Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
            Dao<ExameTeorico> exameteoricoDAO = new GenericDAO<>(ExameTeorico.class);

            Instrutor i = instrutorDAO.buscarPorId(5);
            
            Aluno a1 = alunoDAO.buscarPorId(3);
            Aluno a2 = alunoDAO.buscarPorId(4);
            List<Aluno> alunos = new ArrayList<>();
            alunos.add(a1);
            alunos.add(a2);

            ExameTeorico et = new ExameTeorico("A", "Local de aplicação 1", i, 0, new SimpleDateFormat("dd/MM/yyyy").parse("08/10/2018"), new SimpleDateFormat("HH:mm").parse("13:00"), 20, true, alunos);

            exameteoricoDAO.salvar(et);
            
            List<ExameTeorico> examesteoricos = exameteoricoDAO.buscarTodos(ExameTeorico.class);
            for (ExameTeorico exameteorico : examesteoricos) {
                System.out.println(exameteorico.getInstrutor().getNomeCompleto());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteExameTeorico.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
