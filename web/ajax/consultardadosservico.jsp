<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegraParcela"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");

    ControleServico cs = new ControleServico();
    Servico s = cs.buscarServicoPorNome(id);
%>

<div class="input-field col s7">
    <!--<i class="material-icons prefix">local_parking</i>-->
    <select id="valorBD" name="valorBD" onchange="verificarTipoPagamento(this.value,<%=s.getValorVista()%>)">
        <option value="" disabled selected>Opções de parcelamento</option>
        <option value="1">À vista R$<%=s.getValorVista()%></option>
        <%
            ControleRegraParcela crp = new ControleRegraParcela();
            List<RegraParcelas> rps = crp.buscarRegraParcelasPorServico(s);

            for (RegraParcelas rp : rps) {
        %>
        <option value="<%=rp.getParcela()%>"><%=rp.getParcela()%>x de R$<%=rp.getValorParcelado()%></option>
        <%
            }
        %>
    </select>
    <label>Selecione a opção de parcelamento</label>
</div>

