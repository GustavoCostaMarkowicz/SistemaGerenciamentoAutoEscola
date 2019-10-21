<%-- 
    Document   : consultarjustificativa
    Created on : 10/10/2019, 15:46:38
    Author     : João Vitor Gonçalves
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int idRegistro = Integer.parseInt(request.getParameter("idRegistro"));

    ControleRegistro cr = new ControleRegistro();

    Registro r = cr.buscarRegistroPorId(idRegistro);
%>
<div id="modal3" class="modal">
    <div class="modal-content">
        <h5>Justificativa</h5>
        <h6><%=r.getJustificativa()%></h6>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">FECHAR</a>
    </div>
</div>