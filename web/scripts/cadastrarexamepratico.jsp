<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
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

    String sid1 = request.getParameter("id1");
    String sid2 = request.getParameter("id2");
    String sid3 = request.getParameter("id3");
    String sdataExame = request.getParameter("dataexame");
    String shorarioExame = request.getParameter("horarioexame");
    String scodInstrutor = request.getParameter("instrutor");
    String categoria = request.getParameter("categoria");
    String placa = request.getParameter("veiculo");
    String sreteste = request.getParameter("reteste");

    boolean reteste = false;

    if (sreteste.equals("Sim")) {
        reteste = true;
    }

    ControleAluno ca = new ControleAluno();
    List<Aluno> alunos = new ArrayList();
    if (!sid1.equals("")) {
        int id1 = Integer.parseInt(sid1);
        Aluno a1 = ca.buscarAlunosPorId(id1);
        alunos.add(a1);
    }
    if (!sid2.equals("")) {
        int id2 = Integer.parseInt(sid2);
        Aluno a2 = ca.buscarAlunosPorId(id2);
        alunos.add(a2);
    }
    if (!sid3.equals("")) {
        int id3 = Integer.parseInt(sid3);
        Aluno a3 = ca.buscarAlunosPorId(id3);
        alunos.add(a3);
    }
    Date dataExame = sdf.parse(sdataExame);
    Date horarioExame = sdf1.parse(shorarioExame);

    ControleInstrutor ci = new ControleInstrutor();
    int codInstrutor = Integer.parseInt(scodInstrutor);
    Instrutor i = ci.buscarInstrutorPorId(codInstrutor);

    ControleVeiculo cv = new ControleVeiculo();
    Veiculo v = cv.buscarVeiculosPorId(placa);

    int maximoAlunos = alunos.size();
    ExamePratico ep = new ExamePratico(categoria, i, v, 0, dataExame, horarioExame, maximoAlunos, reteste, alunos);

    ControleExamePratico cep = new ControleExamePratico();
    cep.inserirExamePratico(ep);

    response.sendRedirect("../relacaoExamePratico.jsp");


%>
