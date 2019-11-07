<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    gerarPdf gp = new gerarPdf();
    gp.gerarPdfResultadoExame(request, response);
  
%>