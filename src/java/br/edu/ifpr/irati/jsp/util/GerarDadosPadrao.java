package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.controle.ControleAluno;
import br.edu.ifpr.irati.jsp.controle.ControleAtendente;
import br.edu.ifpr.irati.jsp.controle.ControleDiretor;
import br.edu.ifpr.irati.jsp.controle.ControleExameMedico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePratico;
import br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico;
import br.edu.ifpr.irati.jsp.controle.ControleExameTeorico;
import br.edu.ifpr.irati.jsp.controle.ControleInstrutor;
import br.edu.ifpr.irati.jsp.controle.ControleItemMenu;
import br.edu.ifpr.irati.jsp.controle.ControleRegraParcela;
import br.edu.ifpr.irati.jsp.controle.ControleServico;
import br.edu.ifpr.irati.jsp.controle.ControleVeiculo;
import br.edu.ifpr.irati.jsp.exception.HashGenerationException;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Atendente;
import br.edu.ifpr.irati.jsp.modelo.Diretor;
import br.edu.ifpr.irati.jsp.modelo.ExameMedico;
import br.edu.ifpr.irati.jsp.modelo.ExamePratico;
import br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico;
import br.edu.ifpr.irati.jsp.modelo.ExameTeorico;
import br.edu.ifpr.irati.jsp.modelo.Instrutor;
import br.edu.ifpr.irati.jsp.modelo.ItemMenu;
import br.edu.ifpr.irati.jsp.modelo.RegraParcelas;
import br.edu.ifpr.irati.jsp.modelo.Servico;
import br.edu.ifpr.irati.jsp.modelo.Veiculo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GerarDadosPadrao {

    public void gerarDados() {

        try {
            ControleItemMenu controleItemMenu = new ControleItemMenu();
            
            ItemMenu itAluno = new ItemMenu(1, "Alunos", "aluno.jsp", "person", true, true);
            ItemMenu itFuncionario = new ItemMenu(2, "Funcionários", "funcionario.jsp", "assignment_ind", true, false);
            ItemMenu itExame = new ItemMenu(3, "Exames", "exame.jsp", "date_range", true, true);
            ItemMenu itVeiculo = new ItemMenu(4, "Veículos", "veiculo.jsp", "directions_car", true, true);
            ItemMenu itLogout = new ItemMenu(4, "Sair", "scripts/logout.jsp", "remove_from_queue", true, true);
            
            controleItemMenu.inserirItemMenu(itAluno);
            controleItemMenu.inserirItemMenu(itFuncionario);
            controleItemMenu.inserirItemMenu(itExame);
            controleItemMenu.inserirItemMenu(itVeiculo);
            controleItemMenu.inserirItemMenu(itLogout);
            
            ControleAluno controleAluno = new ControleAluno();
            ControleInstrutor controleInstrutor = new ControleInstrutor();
            ControleAtendente controleAtendente = new ControleAtendente();
            ControleDiretor controleDiretor = new ControleDiretor();
            ControleVeiculo controleVeiculo = new ControleVeiculo();
            ControleServico controleServico = new ControleServico();

            Aluno al = new Aluno("122223", "SESP-PR", "PR", "solteiro", "Pai Aluno", "Mãe Aluno", new SimpleDateFormat("dd/MM/yyyy").parse("05/11/1992"), "Irati-PR", "brasileiro", "masculino", "EM completo", false, "O+", "aluno@email.com", 0, "Nome Aluno", new Date(), "Irati", "Paraná", "Rua do Aluno", "99", "casa", "84500-000", "Bairro do Aluno", null, "(42)99930-4455", "11.111.111-1", "111.111.111-11");
            Aluno al2 = new Aluno("1111", "SESP-PR", "PR", "casado", "Pai Aluno 2", "Mãe Aluno 2", new SimpleDateFormat("dd/MM/yyyy").parse("01/01/1996"), "Irati-PR", "brasileiro", "feminino", "EM completo", false, "AB+", "aluno2@email.com", 0, "Nome Aluno 2", new Date(), "Irati", "Paraná", "Rua do Aluno 2", "11", "casa", "84500-000", "Bairro do Aluno 2", null, "(42)98855-0055", "44.444.444-4", "444.444.444-44");
            Instrutor in = new Instrutor(new Date(), "111222333", new SimpleDateFormat("dd/MM/yyyy").parse("30/08/2020"), "Prático/Teórico", "ativo", 0, "Nome Instrutor", new Date(), "Irati", "Paraná", null, null, null, "84500-000", null, "(42)3422-8080", null, "22.222.222-2", "222.222.222-22");
            Atendente at = new Atendente("Nome do Atendente", "(42)99900-8888", "null", 0, "atendente1", "atd1senha", "Irati");
            Diretor d = new Diretor("123.456.789", 0, "diretor1", "dir1senha", "Irati");
            Veiculo ve = new Veiculo("ABC-1234", "Chevrolet", "Onix", "2015");
            Servico se = new Servico("Primeira Carteira A", 1300.00);
            
            controleAluno.inserirAluno(al);
            controleAluno.inserirAluno(al2);
            controleInstrutor.inserirInstrutor(in);
            controleAtendente.inserirAtendente(at);
            controleDiretor.salvarUsuario(d);
            controleVeiculo.inserirVeiculo(ve);
            controleServico.inserirServico(se);

            ControleExameMedico controleEM = new ControleExameMedico();
            ControleExamePratico controleEPr = new ControleExamePratico();
            ControleExamePsicotecnico controleEPs = new ControleExamePsicotecnico();
            ControleExameTeorico controleET = new ControleExameTeorico();
            ControleRegraParcela controleRP = new ControleRegraParcela();

            Aluno alE = controleAluno.buscarAlunosPorId(1);
            Aluno alE2 = controleAluno.buscarAlunosPorId(3);
            List<Aluno> alunosMe = new ArrayList<>();
            List<Aluno> alunosPr = new ArrayList<>();
            List<Aluno> alunosPs = new ArrayList<>();
            List<Aluno> alunosTe = new ArrayList<>();
            alunosMe.add(alE);
            alunosPr.add(alE);
            alunosPr.add(alE2);
            alunosPs.add(alE2);
            alunosTe.add(alE);
            alunosTe.add(alE2);
            Instrutor inE = controleInstrutor.buscarInstrutorPorId(3);
            Veiculo veE = controleVeiculo.buscarVeiculosPorId("ABC-1234");
            Servico seRp = controleServico.buscarServicoPorNome("Primeira Carteira A");
            
            ExameMedico em = new ExameMedico("Medico 1", "Clinica 1", 0, new SimpleDateFormat("dd/MM/yyyy").parse("10/10/2018"), new SimpleDateFormat("HH:mm").parse("16:00"), 1, false, alunosMe);
            ExamePratico epr = new ExamePratico("AB", inE, veE, 0, new SimpleDateFormat("dd/MM/yyyy").parse("30/09/2018"), new SimpleDateFormat("HH:mm").parse("14:00"), 3, false, alunosPr);
            ExamePsicotecnico eps = new ExamePsicotecnico("Psicologo 2", "Clinica 2", 0, new SimpleDateFormat("dd/MM/yyyy").parse("10/14/2018"), new SimpleDateFormat("HH:mm").parse("07:00"), 1, false, alunosPs);
            ExameTeorico et = new ExameTeorico("A", "Local de aplicação 1", inE, 0, new SimpleDateFormat("dd/MM/yyyy").parse("08/10/2018"), new SimpleDateFormat("HH:mm").parse("13:00"), 20, true, alunosTe);
            RegraParcelas rp = new RegraParcelas(2, 1350.00, seRp);
            
            controleEM.inserirExameMedico(em);
            controleEPr.inserirExamePratico(epr);
            controleEPs.inserirExamePsicotecnico(eps);
            controleET.inserirExameTeorico(et);
            controleRP.inserirRegraParcelas(rp);
                  
        } catch (ParseException ex) {
            Logger.getLogger(GerarDadosPadrao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
