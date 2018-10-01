package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.ArrayList;
import java.util.List;

public class TestePagamentoServico {

    public static void main(String[] args) {

        Dao<Servico> pagamentoservicoDAO = new GenericDAO<>(Servico.class);

        List<Integer> parcelasA = new ArrayList<>();
        parcelasA.add(2);
        parcelasA.add(6);
        parcelasA.add(10);
        Servico ps = new Servico("Primeira carteira A", 1200.00, 1300.00, parcelasA);

        pagamentoservicoDAO.salvar(ps);

        List<Servico> pagamentosservicos = pagamentoservicoDAO.buscarTodos(Servico.class);
        for (Servico pagamentoservico : pagamentosservicos) {
            System.out.println(pagamentoservico.getTipoServico());
        }

        System.exit(0);

    }

}
