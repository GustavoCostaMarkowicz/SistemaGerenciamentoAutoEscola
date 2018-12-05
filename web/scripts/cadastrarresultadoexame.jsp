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
    
    ControleExame ce = new ControleExame();
    
    int idExame = Integer.parseInt(sidExame);
    Exame exame = ce.buscarExamesPorId(idExame);
    
    ControleResultadoExame cre = new ControleResultadoExame();
    
    for(int i = 0; i < exame.getMaximoAlunos(); i++){
        String si = String.valueOf(i);
        String resultado = request.getParameter(si);
        ResultadoExame re = new ResultadoExame(0, exame.getAlunos().get(i), exame, resultado);
        cre.inserirResultadoExame(re);
    }
    
    response.sendRedirect("../exame.jsp");

%>
