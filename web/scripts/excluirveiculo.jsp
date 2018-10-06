<%-- 
    Document   : excluirveiculo
    Created on : 06/10/2018, 14:44:15
    Author     : João Vitor Gonçalves
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    
    String placa = request.getParameter("placa");
    
    ControleVeiculo cv = new ControleVeiculo();
    cv.excluirVeiculo(cv.buscarVeiculosPorId(placa));
    
    response.sendRedirect("../veiculo.jsp");

%>