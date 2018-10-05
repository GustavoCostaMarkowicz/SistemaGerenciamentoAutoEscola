
package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import br.edu.ifpr.irati.jsp.modelo.Veiculo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteExamePratico {

    public static void main(String[] args) {

        try {
            Dao<Instrutor> instrutorDAO = new GenericDAO<>(Instrutor.class);
            Dao<Veiculo> veiculoDAO = new GenericDAO<>(Veiculo.class);
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
            Dao<ExamePratico> examepraticoDAO = new GenericDAO<>(ExamePratico.class);

            Instrutor i = instrutorDAO.buscarPorId(5);

            Veiculo v = veiculoDAO.buscarPorId("ABC-1234");

            Aluno a1 = alunoDAO.buscarPorId(3);
            Aluno a2 = alunoDAO.buscarPorId(4);
            List<Aluno> alunos = new ArrayList<>();
            alunos.add(a1);
            alunos.add(a2);

            ExamePratico ep = new ExamePratico("AB", i, v, 0, new SimpleDateFormat("dd/MM/yyyy").parse("30/09/2018"), new SimpleDateFormat("HH:mm").parse("14:00"), 3, false, alunos);

            examepraticoDAO.salvar(ep);

            List<ExamePratico> examespraticos = examepraticoDAO.buscarTodos(ExamePratico.class);
            for (ExamePratico examepratico : examespraticos) {
                System.out.println(examepratico.getVeiculo().getModelo());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteExamePratico.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
