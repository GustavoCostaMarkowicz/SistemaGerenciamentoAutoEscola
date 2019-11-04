<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegraParcela"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%

    String tipoServ = request.getParameter("serv");
    ControleServico cs = new ControleServico();
    ControleRegraParcela crp = new ControleRegraParcela();
    List<RegraParcelas> rps = crp.buscarRegraParcelasPorServico(cs.buscarServicoPorNome(tipoServ));
    for(RegraParcelas rp : rps){
        crp.excluirRegraParcelas(rp);
    }
    cs.excluirServico(cs.buscarServicoPorNome(tipoServ));
    response.sendRedirect("../aluno.jsp");
    

%>
