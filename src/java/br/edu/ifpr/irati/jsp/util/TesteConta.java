package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.RegraParcelas;
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
            Dao<Servico> servicoDAO = new GenericDAO<>(Servico.class);
            Dao<RegraParcelas> regraParcelasDAO = new GenericDAO<>(RegraParcelas.class);

            Servico s = servicoDAO.buscarPorId("Primeira Carteira A");
            List<Servico> servicos = new ArrayList<>();
            servicos.add(s);
            
            Aluno a = new Aluno("SESP-PR", "PR", "casado", "Pai Aluno 2", "Mãe Aluno 2", new SimpleDateFormat("dd/MM/yyyy").parse("01/01/1996"), "Irati-PR", "brasileiro", "feminino", "EM completo", false, "AB+", "aluno2@email.com", 0, "Nome Aluno 2", new Date(), "Irati", "Paraná", "Rua do Aluno 2", "11", "casa", "84500-000", "Bairro do Aluno 2", null, "(42)98855-0055", "44.444.444-4", "444.444.444-44");
            
            int opcaoParcela = 1;
            double valorTotal = 0.0;
            //Apenas ao abrir uma conta a parcela da conta será igual à uma das parcela do serviço vinculado à essa conta
            //A parcela pode ser igual a 1 para o caso de pagamento à vista
            //Caso a quantidade de parcelas seja negociado, o usuário irá informar ao sistema a quantidade de parcelas           
            //O valor total ao abrir uma conta será baseado na quantidade de parcelas escolhidas pelo usuário baseado
            //nas informações acima
            //Caso a quantidade de parcelas tenha sido negociado, o usuário também deverá informar o valor total
            //Os valores também podem ser alterados independentemente do outro
            //Por Exemplo, a quantidade de parcelas pode ser baseada no banco de dados, mas o valor total alterado para
            //um valor negociado
            
            //Nesse caso o usuário informa o valor de parcelas baseado nos valores do banco de dados
            //O valor total também é definido para o mesmo do banco de dados a partir da parcela selecionada
            List<RegraParcelas> parcelas = regraParcelasDAO.buscarTodos(RegraParcelas.class);
            for(Servico servico: servicos){
                for(RegraParcelas parcela: parcelas){
                    if(regraParcelasDAO.buscarPorId(servico.getTipoServico()).getParcela() == 2 & regraParcelasDAO.buscarPorId(servico.getTipoServico()).getServico().getTipoServico().equals("Primeira Carteira A")){
                        opcaoParcela = regraParcelasDAO.buscarPorId(servico.getTipoServico()).getParcela();
                        valorTotal = regraParcelasDAO.buscarPorId(servico.getTipoServico()).getValorParcelado();
                    }
                }
            }
            
            Conta c = new Conta(valorTotal, opcaoParcela, a, servicos);

            alunoDAO.salvar(a);
            contaDAO.salvar(c);

            List<Conta> contas = contaDAO.buscarTodos(Conta.class);
            for (Conta conta : contas) {
                System.out.println(conta.getAluno().getNomeCompleto());
                System.out.println(conta.getValorTotal());
                System.out.println(conta.getParcelas());
            }

            System.exit(0);

        } catch (ParseException ex) {
            Logger.getLogger(TesteConta.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
