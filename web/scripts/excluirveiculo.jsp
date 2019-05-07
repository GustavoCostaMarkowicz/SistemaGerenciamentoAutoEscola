<%-- 
    Document   : excluirusuario
    Created on : 30/06/2018, 16:38:07
    Author     : Usuario
--%>


<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String placa = request.getParameter("placa");
            ControleVeiculo cv = new ControleVeiculo();
            cv.excluirVeiculo(cv.buscarVeiculosPorId(placa));
            response.sendRedirect("../index.jsp");        
        %>
    </body>
</html>