<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações da Conta</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>

    <%
        session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuario");
        boolean logado = false;
        if (u != null) {
            logado = true;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
        int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
        ControleAluno ca = new ControleAluno();
        ControleConta cc = new ControleConta();
        ControleUsuario cu = new ControleUsuario();
        Aluno a = ca.buscarAlunosPorId(idPessoa);
        Conta c = ca.buscarContaAluno(idPessoa);
        DecimalFormat formato = new DecimalFormat("#.##");
        int parcelas = (int) ((c.getValorInicial() - c.getValorPago()) / (c.getValorInicial() / c.getParcelas()));
    %>

    <style>

        div#titulo {

            background-color: lightgray;
            padding: 15px;
            font-weight: bold;


        }

        div#subtitulo {

            background-color: gray;
            font-weight: bold;
            color: white;

        }

        body {

            display: flex;
            min-height: 100vh;
            flex-direction: column;
            overflow-x: hidden;

        }

        main {
            flex: 1 0 auto;
        }

        th {
            text-align: center;
        }

        .ultimo {
            border-right: solid 1px lightgray;
        }

        table {
            margin-top: -20px;
        }

        a#botaopagamento {
            font-weight: normal;
            visibility: visible;
        }

        td.valido {
            color: green;
        }

        td.pago {
            color: black;
        }

        td.invalido {
            color: red;
        }

        td.false {
            text-decoration: line-through;
            color: red;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>

            <div id="titulo">
                <h6 align="center"> CONTA </h6>
            </div>

            <div id="subtitulo" class="row">
                <div class="center input-field col s4">
                    <h6><%=a.getNomeCompleto()%></h6>
                </div>
                <div class="center input-field col s4">
                    <h6>Valor restante para pagamento: R$<%=formato.format(c.getValorInicial() - c.getValorPago())%></h6>
                </div>
                <div class="center input-field col s4">
                    <h6>Parcelas restantes: <%=parcelas%></h6>
                </div>
            </div>

            <table class="centered">

                <tr>
                    <th>Usuário</th>
                    <th>Data</th>
                    <th>Hora</th>
                    <th class="ultimo">Registro</th>
                        <%
                            if (parcelas != 0) {
                        %>
                    <th>
                        Valor: R$
                        <div class="input-field inline">
                            <input id="valorPago" type="text">
                        </div>
                        <a id="botaopagamento" class="waves-effect waves-light btn" onclick="validarValorPagamento();" href="scripts/realizarpagamento.jsp?idPessoa=<%=idPessoa%>&idUsuario=<%=u.getIdUsuario()%>&valorPago=" value="Pagamento">Realizar Pagamento</a>
                    </th>
                    <%
                    } else if (cu.verificarTipoUsuario(u.getIdUsuario()) == "diretor") {
                    %>
                    <th><a id="botaopagamento" href="vincularServicoConta.jsp?idPessoa=<%=idPessoa%>" class="waves-effect waves-light btn">Vincular um novo serviço à conta</a></th>
                        <%
                        } else {
                        %>
                    <th><a id="botaopagamento" class="waves-effect waves-light btn">Essa conta não tem pagamentos pendentes</a></th>
                        <%
                            }
                        %>
                </tr>

                <%
                    List<Registro> registros = cc.buscarRegistrosConta(a.getIdPessoa());
                    int ordem = registros.size() - 1;

                    int controlePosicaoRegistro = 0;
                    for (int k = 0; k < (registros.size() - 1); k++) {
                        if (registros.get(k).getTextoRegistro().contains(c.getServicos().get(c.getServicos().size() - 1).getTipoServico())) {
                            controlePosicaoRegistro = k;
                            k = registros.size();
                        }
                    }

                    int diaParcela = registros.get(controlePosicaoRegistro).getDataRegistro().getDate();
                    int mesPrimeiraParcela = registros.get(controlePosicaoRegistro).getDataRegistro().getMonth() + 1;

                    String[] meses = new String[12];
                    meses[0] = "Janeiro";
                    meses[1] = "Fevereiro";
                    meses[2] = "Março";
                    meses[3] = "Abril";
                    meses[4] = "Maio";
                    meses[5] = "Junho";
                    meses[6] = "Julho";
                    meses[7] = "Agosto";
                    meses[8] = "Setembro";
                    meses[9] = "Outubro";
                    meses[10] = "Novembro";
                    meses[11] = "Dezembro";

                    int i = ordem;

                    int anoParcela = registros.get(controlePosicaoRegistro).getDataRegistro().getYear() + 1900;

                    if (mesPrimeiraParcela > 11) {
                        mesPrimeiraParcela = 0;
                        anoParcela += 1;
                    }

                    int controleParcela = mesPrimeiraParcela;
                    String[] validade = new String[c.getParcelas()];
                    Date dataAtual = new Date();
                    double valorParcela = c.getValorInicial() / c.getParcelas();
                    double controleValorPago = c.getValorPago();
                    for (int k = 0; k < c.getParcelas(); k++) {
                        if ((controleValorPago - valorParcela) >= 0) {
                            validade[k] = "pago";
                        } else {
                            if (anoParcela > (dataAtual.getYear() + 1900)) {
                                validade[k] = "valido";
                            } else if (anoParcela == (dataAtual.getYear() + 1900)) {
                                if (controleParcela > dataAtual.getMonth()) {
                                    validade[k] = "valido";
                                } else if (controleParcela == dataAtual.getMonth()) {
                                    if (diaParcela >= dataAtual.getDate()) {
                                        validade[k] = "valido";
                                    } else {
                                        validade[k] = "invalido";
                                    }
                                } else {
                                    validade[k] = "invalido";
                                }
                            } else {
                                validade[k] = "invalido";
                            }
                        }

                        controleParcela++;
                        if (controleParcela > 11) {
                            controleParcela = 0;
                            anoParcela++;
                        }
                        controleValorPago -= valorParcela;
                    }

                    anoParcela = registros.get(controlePosicaoRegistro).getDataRegistro().getYear() + 1900;
                    if (mesPrimeiraParcela == 0) {
                        anoParcela += 1;
                    }

                    controleParcela = mesPrimeiraParcela;
                    controleValorPago = c.getValorPago();
                    double moduloConta = c.getValorPago() % (c.getValorInicial() / c.getParcelas());
                    int contadorModulo = 0;
                    int controleInvalidacao = 0;

                    if (c.getParcelas() > registros.size()) {

                        for (int j = 0; j < c.getParcelas(); j++) {

                %>


                <%                                    if (j < registros.size()) {
                %>
                <tr>
                    <%
                        if (cu.verificarTipoUsuario(u.getIdUsuario()) == "diretor" & registros.get(i).isInvalidavel() & registros.get(i).isValido() & (registros.get(i).getTextoRegistro().contains("Pagamento de R$") | controleInvalidacao == 0) & registros.get(i).getTextoRegistro().contains(c.getServicos().get(c.getServicos().size() - 1).getTipoServico())) {
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><a href="scripts/invalidarregistro.jsp?idRegistro=<%=registros.get(i).getIdRegistro()%>&idPessoa=<%=idPessoa%>" value="Invalidar"><i class="tooltipped material-icons left red-text" data-position="right" data-tooltip="invalidar registro">remove_circle</i></a><%=registros.get(i).getUsuario().getLogin()%></td>
                    <%
                        if (registros.get(i).getTextoRegistro().contains("ª parcela")) {
                            controleInvalidacao++;
                        }
                    } else {
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><%=registros.get(i).getUsuario().getLogin()%></td>
                    <%
                        }
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><%=sdf.format(registros.get(i).getDataRegistro())%></td>
                    <td class="<%=registros.get(i).isValido()%>"><%=sdf1.format(registros.get(i).getHorarioRegistro())%></td>
                    <%
                        if (registros.get(i).isValido()) {
                    %>
                    <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%></td>
                    <%
                    } else {
                    %>
                    <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%><br>REGISTRO INVÁLIDO</td>
                        <%
                            }
                        %>
                        <%
                            if ((controleValorPago - valorParcela) >= 0) {
                        %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>PAGO"%></td>
                    <%
                    } else {
                        if (contadorModulo == 0) {
                            contadorModulo++;
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format((c.getValorInicial() / c.getParcelas()) - moduloConta)%></td>
                    <%
                    } else {
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format(c.getValorInicial() / c.getParcelas())%></td>
                    <%
                            }
                        }
                    %>
                </tr>
                <%  } else { %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="ultimo"></td>
                    <%
                        if ((controleValorPago - valorParcela) >= 0) {
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>PAGO"%></td>
                    <%
                    } else {
                        if (contadorModulo == 0) {
                            contadorModulo++;
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format((c.getValorInicial() / c.getParcelas()) - moduloConta)%></td>
                    <%
                    } else {
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format(c.getValorInicial() / c.getParcelas())%></td>
                    <%
                            }
                        }
                    %>
                </tr>
                <%}
                        controleParcela++;
                        if (controleParcela > 11) {
                            controleParcela = 0;
                            anoParcela++;
                        }
                        controleValorPago -= valorParcela;
                        i--;
                    }
                %>


                <%
                } else {

                    int j = 0;
                    for (i = ordem; i >= 0; i--) {

                %>

                <tr>
                    <%                                if (cu.verificarTipoUsuario(u.getIdUsuario()) == "diretor" & registros.get(i).isInvalidavel() & registros.get(i).isValido() & (registros.get(i).getTextoRegistro().contains("Pagamento de R$") | controleInvalidacao == 0) & registros.get(i).getTextoRegistro().contains(c.getServicos().get(c.getServicos().size() - 1).getTipoServico())) {
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><a href="scripts/invalidarregistro.jsp?idRegistro=<%=registros.get(i).getIdRegistro()%>&idPessoa=<%=idPessoa%>" value="Invalidar"><i class="tooltipped material-icons left red-text" data-position="right" data-tooltip="invalidar registro">remove_circle</i></a><%=registros.get(i).getUsuario().getLogin()%></td>
                    <%
                        if (registros.get(i).getTextoRegistro().contains("ª parcela")) {
                            controleInvalidacao++;
                        }
                    } else {
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><%=registros.get(i).getUsuario().getLogin()%></td>
                    <%
                        }
                    %>
                    <td class="<%=registros.get(i).isValido()%>"><%=sdf.format(registros.get(i).getDataRegistro())%></td>
                    <td class="<%=registros.get(i).isValido()%>"><%=sdf1.format(registros.get(i).getHorarioRegistro())%></td>
                    <%
                        if (registros.get(i).isValido()) {
                    %>
                    <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%></td>
                    <%
                    } else {
                    %>
                    <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%><br>REGISTRO INVÁLIDO</td>
                        <%
                            }
                        %>
                        <% if (j < c.getParcelas()) { %>
                        <%
                            if ((controleValorPago - valorParcela) >= 0) {
                        %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>PAGO"%></td>
                    <%
                    } else {
                        if (contadorModulo == 0) {
                            contadorModulo++;
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format((c.getValorInicial() / c.getParcelas()) - moduloConta)%></td>
                    <%
                    } else {
                    %>
                    <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format(c.getValorInicial() / c.getParcelas())%></td>
                    <%
                            }
                        }
                    %>
                    <% } else {%>
                    <td></td>
                    <% } %>
                </tr>

                <%
                            controleParcela++;
                            if (controleParcela > 11) {
                                controleParcela = 0;
                                anoParcela++;
                            }
                            controleValorPago -= valorParcela;
                            j++;
                        }
                    }

                %>
            </table>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

    <script>
        function validarValorPagamento() {
            var valorPago = document.getElementById("valorPago").value;
            document.getElementById("botaopagamento").href += valorPago;
        }
    </script>

</html>
