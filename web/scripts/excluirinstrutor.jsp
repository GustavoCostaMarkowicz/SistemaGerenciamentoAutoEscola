<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));

    ControleInstrutor ci = new ControleInstrutor();

    ci.excluirInstrutor(ci.buscarInstrutorPorId(idPessoa));

    response.sendRedirect("../instrutor.jsp");

%>