<%-- 
    Document   : excluirexameteorico
    Created on : 07/10/2018, 10:51:23
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameTeorico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int idExameTeorico = Integer.parseInt(request.getParameter("idexameteorico"));
            ControleExameTeorico cem = new ControleExameTeorico();
            cem.excluirExameTeorico(cem.buscarExameTeoricosPorId(idExameTeorico));
            response.sendRedirect("../relacaoExameTeorico.jsp");    
            
        %>
    </body>
</html>
