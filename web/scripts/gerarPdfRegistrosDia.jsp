<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%

    gerarPdf gp = new gerarPdf();
    gp.gerarPdfRegistroConta(request, response);

%>