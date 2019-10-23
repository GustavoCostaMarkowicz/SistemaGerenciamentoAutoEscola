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
        String nomeCompleto = a.getNomeCompleto();
        Conta c = ca.buscarContaAluno(idPessoa);
        DecimalFormat formato = new DecimalFormat("#.##");
        Double parcelasDec = ((c.getValorInicial() - c.getValorPago()) / (c.getValorInicial() / c.getParcelas())) - (int) ((c.getValorInicial() - c.getValorPago()) / (c.getValorInicial() / c.getParcelas()));
        int parcelas = (int) ((c.getValorInicial() - c.getValorPago()) / (c.getValorInicial() / c.getParcelas()));
        if (parcelasDec > 0) {
            parcelas += 1;
        }
        if (((c.getValorInicial() - c.getValorPago()) < (c.getValorInicial() / c.getParcelas())) & (c.getValorInicial() > c.getValorPago())) {
            parcelas = 1;
        }
    %>

    <style>

        div.titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#t1{
            margin-bottom: -1px;
        }

        div.titulo h5 {
            font-weight: bold;
        }

        div.titulo h6 {
            font-weight: bold;
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

        .no-select {
            -webkit-user-select: none;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>

            <div class="col s14 m12">
                <div id="principal" class="card">
                    <div class="card-content">

                        <div id="t1" class="titulo amber row">
                            <h5 align="center">Conta</h5>
                        </div>

                        <div id="t2" class="titulo row">
                            <div class="center input-field col s4">
                                <h6><%=nomeCompleto%></h6>
                            </div>
                            <div class="center input-field col s4">
                                <h6>Valor restante para pagamento: R$<%=formato.format(c.getValorInicial() - c.getValorPago())%></h6>
                            </div>
                            <div class="center input-field col s4">
                                <h6>Parcelas restantes: <%=parcelas%></h6>
                            </div>
                        </div>

                        <table id="secundario" class="centered">

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
                                        <input id="valorPago" type="text" onkeyup="verificarApagar();" onkeydown="verificarDigito(window.event.keyCode);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true;
                                                else
                                                    return false;">
                                    </div>
                                    <a id="botaopagamento" class="green waves-effect waves-light btn" onclick="validarValorPagamento(<%=idPessoa%>, <%=u.getIdUsuario()%>);" href="#" value="Pagamento">Realizar Pagamento</a>
                                </th>
                                <%
                                } else if (cu.verificarTipoUsuario(u.getIdUsuario()) == "diretor") {
                                %>
                                <th><a id="botaopagamento" href="vincularServicoConta.jsp?idPessoa=<%=idPessoa%>" class="blue waves-effect waves-light btn">Vincular um novo serviço à conta</a></th>
                                    <%
                                    } else {
                                    %>
                                <th><a id="botaopagamento" class="amber waves-effect waves-light btn">Essa conta não tem pagamentos pendentes</a></th>
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

                                int diaParcela = c.getMesPrimeiraParcela().getDate();
                                int mesPrimeiraParcela = c.getMesPrimeiraParcela().getMonth();
                                for (Registro r : registros) {
                                    if (r.getTextoRegistro().contains("entrada")) {
                                        if (r.isValido()) {
                                            mesPrimeiraParcela -= 1;
                                        }
                                    }
                                }

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

                                int anoParcela = c.getMesPrimeiraParcela().getYear() + 1900;

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
                                <td class="<%=registros.get(i).isValido()%>"><a href="#" onclick="confirmarAcao(<%=registros.get(i).getIdRegistro()%>, <%=idPessoa%>)" value="Invalidar"><i class="tooltipped material-icons left red-text" data-position="right" data-tooltip="invalidar registro">remove_circle</i></a><%=registros.get(i).getUsuario().getLogin()%></td>
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
                                <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%><br>REGISTRO INVÁLIDO <a href="#!" onclick="mostrarJustificativa(<%=registros.get(i).getIdRegistro()%>);"><i style="font-size: 18px; color: black;" class="material-icons">help</i></a></td>
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
                                <td class="<%=validade[j]%>"><%=(j + 1) + "ª Parcela<br>Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] + " de " + anoParcela + "<br>Valor - R$" + formato.format(((c.getValorInicial() / c.getParcelas()) - moduloConta))%></td>
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
                                <td class="<%=registros.get(i).isValido()%>"><a href="#" onclick="confirmarAcao(<%=registros.get(i).getIdRegistro()%>, <%=idPessoa%>)" value="Invalidar"><i class="tooltipped material-icons left red-text" data-position="right" data-tooltip="invalidar registro">remove_circle</i></a><%=registros.get(i).getUsuario().getLogin()%></td>
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
                                <td class="<%=registros.get(i).isValido()%> ultimo"><%=registros.get(i).getTextoRegistro()%><br>REGISTRO INVÁLIDO <a href="#!" onclick="mostrarJustificativa(<%=registros.get(i).getIdRegistro()%>);"><i style="font-size: 18px; color: black;" class="material-icons">help</i></a></td>
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
                    </div>
                </div>
            </div>
                        
            <div id="modalInvalidar"></div>
            <div id="modalValidarPgto"></div>
            <div id="modalJustificativa"></div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

    <script>
        function inicializarModals() {
            $('.modal').modal({});
        }

        $(document).ready(inicializarModals());

        function validarValorPagamento(idPessoa, idUsuario) {
            var valorPago = document.getElementById("valorPago").value;
            var xhttp;
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById("modalValidarPgto").innerHTML = this.responseText;
                    $('.modal').modal({});
                    $('#modal2').modal('open');
                }
            };
            xhttp.open("GET", "ajax/validarvalorpagamento.jsp?valorPago=" + valorPago + "&idPessoa=" + idPessoa + "&idUsuario=" + idUsuario, true);
            xhttp.send();
        }

        function confirmarAcao(idRegistro, idPessoa) {
            var modal = "<div id='modal1' class='modal'><div class='modal-content'><h5>Invalidar registro</h5><h6>Deseja realmente invalidar o registro?<br>Informe a justificativa:<div class='row'><form class='col s12'><div class='row'><div class='input-field col s12'><textarea id='justificativa' class='materialize-textarea'></textarea><label for='justificativa'></label></div></div></form></div></h6></div><div class='modal-footer'><a href='#!' class='modal-close waves-effect btn-flat' style='color: red;'>CANCELAR</a><a id='botaoInvalidar' onclick='adicionarJustificativa()' href='scripts/invalidarregistro.jsp?idRegistro=" + idRegistro + "&idPessoa=" + idPessoa + "&justificativa=' class='modal-close waves-effect btn-flat' style='color: green;'>INVALIDAR</a></div></div>";
            document.getElementById("modalInvalidar").innerHTML = modal;
            $('.modal').modal({});
            $('#modal1').modal('open');
        }
        
        function adicionarJustificativa() {
            var justificativa = document.getElementById("justificativa").value;
            document.getElementById("botaoInvalidar").href += justificativa;
        }
        
        function mostrarJustificativa(idRegistro){
            var xhttp;
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById("modalJustificativa").innerHTML = this.responseText;
                    $('.modal').modal({});
                    $('#modal3').modal('open');
                }
            };
            xhttp.open("GET", "ajax/consultarjustificativa.jsp?idRegistro=" + idRegistro, true);
            xhttp.send();
        }
        
        function verificarDigito(digito) {
            var textoVP = document.getElementById("valorPago").value;
            var virgula = 0;
            var posVirgula;
            for (var i = 0; i < textoVP.length; i++) {
                if (textoVP[i] === ",") {
                    virgula++;
                    posVirgula = i;
                }
            }
            if (digito === 188 & virgula === 0 & textoVP.length > 0) {
                document.getElementById("valorPago").value += ",";
                document.getElementById("valorPago").setAttribute('maxlength', textoVP.length + 3);
            }
            if (digito === 8 & posVirgula === textoVP.length - 1) {
                document.getElementById("valorPago").setAttribute('maxlength', '100');
            }
        }

        function verificarApagar() {
            if (document.getElementById("valorPago").value === "") {
                document.getElementById("valorPago").setAttribute('maxlength', '100');
            }
        }

        function controleCB(checkbox, idPessoa, idUsuario, valorPago, valorParcela) {
            if (checkbox == document.getElementById("primeiraParcela").value) {
                document.getElementById("cb" + checkbox).checked = true;
            } else if (document.getElementById("cb" + (checkbox - 1)).checked === false) {
                document.getElementById("cb" + checkbox).checked = false;
            } else if (checkbox == document.getElementById("ultimaParcela").value) {
                if (document.getElementById("cb" + (checkbox)).checked === true) {
                    var xhttp;
                    xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            document.getElementById("modalRodape").innerHTML = this.responseText;
                            document.getElementById("troco").innerHTML = "Troco: R$" + document.getElementById("trocoAjax").value;
                        }
                    };
                    xhttp.open("GET", "ajax/atualizarvalorpagamento.jsp?idPessoa=" + idPessoa + "&idUsuario=" + idUsuario + "&valorPago=" + valorPago + "&valorParcela=" + valorParcela + "&acao=1&primeiraParcela=" + document.getElementById("primeiraParcela").value + "&ultimaParcela=" + document.getElementById("ultimaParcela").value + "&parcelaSelecionada=" + checkbox, true);
                    xhttp.send();
                } else if (document.getElementById("cb" + (checkbox)).checked === false) {
                    var xhttp;
                    xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            document.getElementById("modalRodape").innerHTML = this.responseText;
                            document.getElementById("troco").innerHTML = "Troco: R$" + document.getElementById("trocoAjax").value;
                        }
                    };
                    xhttp.open("GET", "ajax/atualizarvalorpagamento.jsp?idPessoa=" + idPessoa + "&idUsuario=" + idUsuario + "&valorPago=" + valorPago + "&valorParcela=" + valorParcela + "&acao=2&primeiraParcela=" + document.getElementById("primeiraParcela").value + "&ultimaParcela=" + document.getElementById("ultimaParcela").value + "&parcelaSelecionada=" + checkbox, true);
                    xhttp.send();
                }
            } else if (document.getElementById("cb" + (checkbox + 1)).checked === true) {
                document.getElementById("cb" + checkbox).checked = true;
            } else if (document.getElementById("cb" + (checkbox)).checked === true) {
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("modalRodape").innerHTML = this.responseText;
                        document.getElementById("troco").innerHTML = "Troco: R$" + document.getElementById("trocoAjax").value;
                    }
                };
                xhttp.open("GET", "ajax/atualizarvalorpagamento.jsp?idPessoa=" + idPessoa + "&idUsuario=" + idUsuario + "&valorPago=" + valorPago + "&valorParcela=" + valorParcela + "&acao=1&primeiraParcela=" + document.getElementById("primeiraParcela").value + "&ultimaParcela=" + document.getElementById("ultimaParcela").value + "&parcelaSelecionada=" + checkbox, true);
                xhttp.send();
            } else if (document.getElementById("cb" + (checkbox)).checked === false) {
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("modalRodape").innerHTML = this.responseText;
                        document.getElementById("troco").innerHTML = "Troco: R$" + document.getElementById("trocoAjax").value;
                    }
                };
                xhttp.open("GET", "ajax/atualizarvalorpagamento.jsp?idPessoa=" + idPessoa + "&idUsuario=" + idUsuario + "&valorPago=" + valorPago + "&valorParcela=" + valorParcela + "&acao=2&primeiraParcela=" + document.getElementById("primeiraParcela").value + "&ultimaParcela=" + document.getElementById("ultimaParcela").value + "&parcelaSelecionada=" + checkbox, true);
                xhttp.send();
            }
        }

    </script>

</html>
