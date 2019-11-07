<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%

    String tipoServ = request.getParameter("serv");
    ControleServico cs = new ControleServico();
    Servico s = cs.buscarServicoPorNome(tipoServ);
    s.setVisivel(false);
    cs.alterarServico(s);
    
    response.sendRedirect("../servico.jsp");
    

%>
