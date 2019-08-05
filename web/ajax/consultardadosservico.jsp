<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegraParcela"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        .input-field .prefix.active {
            color: green;
        }

    </style>

    <%
        String id = request.getParameter("id");

        ControleServico cs = new ControleServico();
        Servico s = cs.buscarServicoPorNome(id);
    %>

    <body>

        <main>
            <div class="input-field col s7">
                <i class="material-icons prefix">local_parking</i>
                <select id="parcelas" name="parcelas">
                    <option value="" disabled selected>Opções de parcelamento</option>
                    <option value="<%=s.getValorVista()%>">À vista R$<%=s.getValorVista()%></option>
                    <%
                        ControleRegraParcela crp = new ControleRegraParcela();
                        List<RegraParcelas> rps = crp.buscarRegraParcelasPorServico(s);

                        for (RegraParcelas rp : rps) {
                    %>
                    <option value="<%=rp.getValorParcelado()%>"><%=rp.getParcela()%>x de R$<%=rp.getValorParcelado()%></option>
                    <%
                        }
                    %>
                </select>
                <label>Selecione a opção de parcelamento</label>
            </div>
            <div class="input-field col s1">
                <a onclick="habilitarSelect();" value="" class="amber tooltipped btn-floating waves-effect waves-light" data-position="left" data-tooltip="preencher valores de pagamento"><i class="material-icons">send</i></a>
                <a onclick="habilitarInput();" value="" class="amber tooltipped btn-floating waves-effect waves-light" data-position="left" data-tooltip="preencher valores de pagamento"><i class="material-icons">send</i></a>
            </div>
        </main>

    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</html>
