<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%

    String sdata = request.getParameter("data");
    
    gerarPdf gp = new gerarPdf();
    
    gp.gerarPdfExamePratico(request, response, sdata);


%>
