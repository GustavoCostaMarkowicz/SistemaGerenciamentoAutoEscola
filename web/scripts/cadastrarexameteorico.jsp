<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Veiculo"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");

    String sdataExame = request.getParameter("dataexame");
    String shorarioExame = request.getParameter("horarioexame");
    String scodInstrutor = request.getParameter("instrutor");
    String servico = request.getParameter("servico");
    String localAplicacao = request.getParameter("localaplicacao");
    String sreteste = request.getParameter("reteste");

    boolean reteste = false;

    if (sreteste.equals("Sim")) {
        reteste = true;
    }

    ControleAluno ca = new ControleAluno();
    List<Aluno> alunos = new ArrayList();
   
    Date dataExame = sdf.parse(sdataExame);
    Date horarioExame = sdf1.parse(shorarioExame);

    ControleInstrutor ci = new ControleInstrutor();
    int codInstrutor = Integer.parseInt(scodInstrutor);
    Instrutor i = ci.buscarInstrutorPorId(codInstrutor);

    int maximoAlunos = alunos.size();
    ExameTeorico et = new ExameTeorico(servico, localAplicacao, i, 0, dataExame, horarioExame, maximoAlunos, reteste, alunos);

    ControleExameTeorico cep = new ControleExameTeorico();
    cep.inserirExameTeorico(et);
    

    response.sendRedirect("../relacaoExameTeorico.jsp");


%>
