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
    SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");

    String sid1 = request.getParameter("id1");
    String sid2 = request.getParameter("id2");
    String sid3 = request.getParameter("id3");
    String sid4 = request.getParameter("id4");
    String sid5 = request.getParameter("id5");
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
    if (!sid4.equals("")) {
        int id4 = Integer.parseInt(sid4);
        Aluno a4 = ca.buscarAlunosPorId(id4);
        alunos.add(a4);
    }
    if (!sid5.equals("")) {
        int id5 = Integer.parseInt(sid5);
        Aluno a5 = ca.buscarAlunosPorId(id5);
        alunos.add(a5);
    }
    Date dataExame = sdf.parse(sdataExame);
    Date horarioExame = sdf1.parse(shorarioExame);

    ControleInstrutor ci = new ControleInstrutor();
    int codInstrutor = Integer.parseInt(scodInstrutor);
    Instrutor i = ci.buscarInstrutorPorId(codInstrutor);

    int maximoAlunos = alunos.size();
    ExameTeorico et = new ExameTeorico(servico, localAplicacao, i, 0, dataExame, horarioExame, maximoAlunos, reteste, alunos);

    ControleExameTeorico cep = new ControleExameTeorico();
    cep.inserirExameTeorico(et);
    
    for(Aluno a: alunos){
        ResultadoExame re = new ResultadoExame(0, a, et, "Indefinido");
        ControleResultadoExame cre = new ControleResultadoExame();
        cre.inserirResultadoExame(re);
    }

    response.sendRedirect("../relacaoExameTeorico.jsp");


%>
