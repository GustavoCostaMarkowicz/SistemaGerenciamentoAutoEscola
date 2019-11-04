<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%

   
    gerarPdf gp = new gerarPdf();
    gp.gerarPdfRecibo(request, response, new Registro());


%>
