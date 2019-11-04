<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String anotacoes = request.getParameter("anotacoes");
%>
<div id="modal4" class="modal">
    <div class="modal-content">
        <h5>Anotações</h5>
        <textarea name="anotacoes" class="materialize-textarea"><%=anotacoes%></textarea>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">CANCELAR</a>
        <a href="#!" class="modal-close waves-effect btn-flat" style="color: green;">CONFIRMAR</a>
    </div>
</div>