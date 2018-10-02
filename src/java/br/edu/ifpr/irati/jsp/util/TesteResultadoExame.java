package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.ResultadoExame;
import java.util.List;
import javax.swing.JOptionPane;

public class TesteResultadoExame {

    public static void main(String[] args) {

        Dao<ResultadoExame> resultadoExameDAO = new GenericDAO<>(ResultadoExame.class);
        Dao<Exame> exameDAO = new GenericDAO<>(Exame.class);

        Exame e = exameDAO.buscarPorId(4);

        List<Aluno> alunosExame = e.getAlunos();

        String resultado;
        boolean r = false;
        for (Aluno aluno : alunosExame) {
            resultado = JOptionPane.showInputDialog(null, "Resultado do Exame: 0-Reprovado / 1-Aprovado", aluno.getNomeCompleto(), JOptionPane.QUESTION_MESSAGE);
            if (resultado.equals("1")) {
                r = true;
            } else if (resultado.equals("0")) {
                r = false;
            }
            ResultadoExame re = new ResultadoExame(aluno, e, r);
            resultadoExameDAO.salvar(re);
        }

        List<ResultadoExame> resultadosExame = resultadoExameDAO.buscarTodos(ResultadoExame.class);
        for (ResultadoExame resultadoExame : resultadosExame) {
            System.out.println(resultadoExame.getAluno().getNomeCompleto());
            System.out.println(resultadoExame.getExame().getDataExame());
            System.out.println(resultadoExame.isResultado());
        }

        System.exit(0);
    }

}
