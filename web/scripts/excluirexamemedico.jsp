<%-- 
    Document   : excluirexamemedico
    Created on : 07/10/2018, 10:51:23
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int idExameMedico = Integer.parseInt(request.getParameter("idexamemedico"));
            ControleExameMedico cem = new ControleExameMedico();
            cem.excluirExameMedico(cem.buscarExameMedicosPorId(idExameMedico));
            response.sendRedirect("../relacaoExameMedico.jsp");    
            
        %>
    </body>
</html>
