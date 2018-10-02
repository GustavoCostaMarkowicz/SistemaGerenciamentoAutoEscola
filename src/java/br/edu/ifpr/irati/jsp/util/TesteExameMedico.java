package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteExameMedico {

    public static void main(String[] args) {

        try {
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
            Dao<ExameMedico> examemedicoDAO = new GenericDAO<>(ExameMedico.class);

            Aluno a = alunoDAO.buscarPorId(2);
            List<Aluno> alunos = new ArrayList<>();
            alunos.add(a);

            ExameMedico em = new ExameMedico("Medico 1", "Clinica 1", 0, new SimpleDateFormat("dd/MM/yyyy").parse("10/10/2018"), new SimpleDateFormat("HH:mm").parse("16:00"), 1, false, alunos);

            examemedicoDAO.salvar(em);

            List<ExameMedico> examesmedicos = examemedicoDAO.buscarTodos(ExameMedico.class);
            for (ExameMedico examemedico : examesmedicos) {
                System.out.println(examemedico.getClinica());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteExameMedico.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
