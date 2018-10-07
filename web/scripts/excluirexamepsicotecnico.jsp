<%-- 
    Document   : excluirexamepsicotecnico
    Created on : 07/10/2018, 15:29:21
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                 <%
            int idExamePsico = Integer.parseInt(request.getParameter("idexamepsico"));
            ControleExamePsicotecnico cep = new ControleExamePsicotecnico();
            cep.excluirExamePsicotecnico(cep.buscarExamePsicotecnicosPorId(idExamePsico));
            response.sendRedirect("../relacaoExamePsicotecnico.jsp");    
            
        %>
    </body>
</html>
