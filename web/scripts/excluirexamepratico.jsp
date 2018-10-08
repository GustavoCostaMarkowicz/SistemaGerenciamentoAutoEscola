<%-- 
    Document   : excluirexamepratico
    Created on : 07/10/2018, 10:51:23
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int idExamePratico = Integer.parseInt(request.getParameter("idexamepratico"));
            ControleExamePratico cem = new ControleExamePratico();
            cem.excluirExamePratico(cem.buscarExamePraticosPorId(idExamePratico));
            response.sendRedirect("../relacaoExamePratico.jsp");    
            
        %>
    </body>
</html>
