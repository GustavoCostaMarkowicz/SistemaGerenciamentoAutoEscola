package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteAluno {

    public static void main(String[] args) {

        try {
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);

            Aluno a = new Aluno("SESP-PR", "PR", "solteiro", "Pai Aluno", "Mãe Aluno", new SimpleDateFormat("dd/MM/yyyy").parse("05/11/1992"), "Irati-PR", "brasileiro", "masculino", "EM completo", false, "O+", "aluno@email.com", 0, "Nome Aluno", new Date(), "Irati", "Paraná", "Rua do Aluno", "99", "casa", "84500-000", "Bairro do Aluno", null, "(42)99930-4455", "11.111.111-1", "111.111.111-11");
            
            alunoDAO.salvar(a);

            List<Aluno> alunos = alunoDAO.buscarTodos(Aluno.class);
            for (Aluno aluno : alunos) {
                System.out.println(aluno.getNomeCompleto());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteAluno.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
