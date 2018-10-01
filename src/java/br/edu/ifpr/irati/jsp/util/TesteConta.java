package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TesteConta {

    public static void main(String[] args) {

        try {
            Dao<Aluno> alunoDAO = new GenericDAO<>(Aluno.class);
            Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
            Dao<Servico> pagamentoservicoDAO = new GenericDAO<>(Servico.class);

            List<Integer> parcelasA = new ArrayList<>();
            parcelasA.add(4);
            parcelasA.add(8);
            parcelasA.add(12);
            Servico ps = new Servico("Alteração carteira E", 1400.00, 1500.00, parcelasA);
            List<Servico> servicos = new ArrayList<>();
            servicos.add(ps);
            
            Aluno a = new Aluno("SESP-PR", "PR", "casado", "Pai Aluno 2", "Mãe Aluno 2", new SimpleDateFormat("dd/MM/yyyy").parse("01/01/1996"), "Irati-PR", "brasileiro", "feminino", "EM completo", false, "AB+", "aluno2@email.com", 0, "Nome Aluno 2", new Date(), "Irati", "Paraná", "Rua do Aluno 2", "11", "casa", "84500-000", "Bairro do Aluno 2", null, "(42)98855-0055", "44.444.444-4", "444.444.444-44");
            List<String> tiposServico1 = new ArrayList<>();
            tiposServico1.add("A");
            Conta c = new Conta(1300, 10, a, servicos);

            alunoDAO.salvar(a);
            pagamentoservicoDAO.salvar(ps);
            contaDAO.salvar(c);

            List<Conta> contas = contaDAO.buscarTodos(Conta.class);
            for (Conta conta : contas) {
                System.out.println(conta.getAluno().getNomeCompleto());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteConta.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
