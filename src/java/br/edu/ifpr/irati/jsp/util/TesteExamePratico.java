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

            List<Boolean> resultadosExame = new ArrayList<>();
            resultadosExame.add(Boolean.TRUE);
            resultadosExame.add(Boolean.FALSE);
            List<Instrutor> instrutores = instrutorDAO.buscarTodos(Instrutor.class);
            Instrutor i = new Instrutor();
            for (Instrutor instrutor : instrutores) {
                if (instrutor.getIdPessoa() == 2) {
                    i = instrutor;
                }
            }
            List<Veiculo> veiculos = veiculoDAO.buscarTodos(Veiculo.class);
            Veiculo v = new Veiculo();
            for (Veiculo veiculo : veiculos) {
                if (veiculo.getPlaca().equals("ABC-1234")) {
                    v = veiculo;
                }
            }
            List<Aluno> alunos = alunoDAO.buscarTodos(Aluno.class);
            Aluno a = new Aluno();
            Aluno a1 = new Aluno();
            for (Aluno aluno : alunos) {
                if (aluno.getIdPessoa() == 5) {
                    a = aluno;
                }
                if (aluno.getIdPessoa() == 1) {
                    a1 = aluno;
                }
            }
            alunos = new ArrayList<>();
            alunos.add(a);
            alunos.add(a1);

            ExamePratico ep = new ExamePratico("AB", i, v, 0, new SimpleDateFormat("dd/MM/yyyy").parse("30/09/2018"), new SimpleDateFormat("HH:mm").parse("14:00"), resultadosExame, 3, false, alunos);

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
