package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteExamePsicotecnico {

    public static void main(String[] args) {

        try {
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
            Dao<ExamePsicotecnico> examepsicotecnicoDAO = new GenericDAO<>(ExamePsicotecnico.class);

            Aluno a = alunoDAO.buscarPorId(2);
            List<Aluno> alunos = new ArrayList<>();
            alunos.add(a);

            ExamePsicotecnico ep = new ExamePsicotecnico("Psicologo 2", "Clinica 2", 0, new SimpleDateFormat("dd/MM/yyyy").parse("10/14/2018"), new SimpleDateFormat("HH:mm").parse("07:00"), 1, false, alunos);

            examepsicotecnicoDAO.salvar(ep);

            List<ExamePsicotecnico> examespsicotecnicos = examepsicotecnicoDAO.buscarTodos(ExamePsicotecnico.class);
            for (ExamePsicotecnico examepsicotecnico : examespsicotecnicos) {
                System.out.println(examepsicotecnico.getClinica());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteExamePsicotecnico.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
