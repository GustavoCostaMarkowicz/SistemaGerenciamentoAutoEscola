<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%

    int idAluno = Integer.parseInt(request.getParameter("idPessoa"));
    
    gerarPdf gpm = new gerarPdf();
    
    
    gpm.gerarPdfAluno(request, response, idAluno);
    
            
    
    response.sendRedirect("../aluno.jsp");


%>
