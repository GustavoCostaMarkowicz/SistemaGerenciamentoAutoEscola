<%-- 
    Document   : excluiraluno
    Created on : 02/10/2018, 14:29:52
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idPessoa = Integer.parseInt(request.getParameter("idpessoa"));
            ControleAluno ca = new ControleAluno();
            ca.excluirAluno(ca.buscarAlunosPorId(idPessoa));
            response.sendRedirect("../aluno.jsp");    
            
        %>
    </body>
</html>
