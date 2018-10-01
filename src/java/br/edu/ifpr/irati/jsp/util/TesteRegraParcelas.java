package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.RegraParcelas;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.util.List;

public class TesteRegraParcelas {

    public static void main(String[] args) {

        Dao<RegraParcelas> regraParcelasDAO = new GenericDAO<>(RegraParcelas.class);
        Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);

        Servico s = servicoDAO.buscarPorId("Primeira Carteira A");

        RegraParcelas rp = new RegraParcelas(2, 1350.00, s);

        regraParcelasDAO.salvar(rp);

        List<RegraParcelas> parcelas = regraParcelasDAO.buscarTodos(RegraParcelas.class);
        for (RegraParcelas parcela : parcelas) {
            System.out.println(parcela.getServico().getTipoServico());
            System.out.println(parcela.getValorParcelado());
        }

        System.exit(0);

    }

}
