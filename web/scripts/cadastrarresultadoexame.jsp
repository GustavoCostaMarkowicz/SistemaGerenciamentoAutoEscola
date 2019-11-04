<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    request.setCharacterEncoding("UTF-8");
    
    String sidExame = request.getParameter("idExame");
    String resultado = request.getParameter("resultado");
    String sidAluno = request.getParameter("idAluno");
    int ida = Integer.parseInt(sidAluno);
    
    ControleExame ce = new ControleExame();
    ControleAluno ca = new ControleAluno();
    Aluno aluno = ca.buscarAlunosPorId(ida);
    
    int idExame = Integer.parseInt(sidExame);
    Exame exame = ce.buscarExamesPorId(idExame);
    exame.setVisivel(false);
    ce.alterarExame(exame);
    
    ControleResultadoExame cre = new ControleResultadoExame();
    
    ResultadoExame re = new ResultadoExame(0, aluno, exame, resultado);
    if (resultado.equals("Aprovado")) {
        aluno.getExamesAprovado().add(re);
    }
    ca.alterarAluno(aluno);
    cre.inserirResultadoExame(re);
    
    response.sendRedirect("../exame.jsp");
    
%>
