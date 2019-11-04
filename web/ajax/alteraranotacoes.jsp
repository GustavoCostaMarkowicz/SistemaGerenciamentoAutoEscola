<%-- 
    Document   : consultarjustificativa
    Created on : 10/10/2019, 15:46:38
    Author     : João Vitor Gonçalves
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String anotacoes = request.getParameter("anotacoes");
    int idConta = Integer.parseInt(request.getParameter("idConta"));
    
    ControleAluno ca = new ControleAluno();
    ControleConta cc = new ControleConta();
    Conta c = ca.buscarContaAluno(idConta);
    c.setAnotacoes(anotacoes);
    cc.alterarConta(c);
%>
<input type="hidden" value="<%=anotacoes%>" id="anotacoesGlobal">
<div id="modal4" class="modal">
    <div class="modal-content">
        <h5>Anotações</h5>
        <h6><%=anotacoes%></h6>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">FECHAR</a>
        <a href="#!" onclick="alterarAnotacoes();" class="modal-close waves-effect waves-green btn-flat" style="color: green;">Alterar anotações</a>
    </div>
</div>