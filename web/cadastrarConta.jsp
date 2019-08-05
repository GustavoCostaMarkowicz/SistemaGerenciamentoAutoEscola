<%-- 
    Document   : cadastrarConta
    Created on : 02/10/2018, 21:55:27
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Conta</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        div#titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        .input-field .prefix.active {
            color: green;
        }

    </style>
    <%    session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuario");
        boolean logado = false;
        if (u != null) {
            logado = true;
        }

        ControleAluno ca = new ControleAluno();

        int idAluno = Integer.parseInt(request.getParameter("idPessoa"));
        String nome = ca.buscarAlunosPorId(idAluno).getNomeCompleto();
    %>
    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>



            <form  action="scripts/conta.jsp" method="POST">

                <%
                    if (u != null) {
                %> <input type="hidden" name="idusuario" value="<%=u.getIdUsuario()%>"/>
                <%
                    }
                %>
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-content">

                            <div id="titulo" class="amber">
                                <h5 align="center">Cadastrar Conta</h5>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Aluno</h6>
                            </div>

                            <input placeholder="" value="<%=idAluno%>" id="id" name="id" type="hidden">

                            <div class="center row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">person</i>
                                    <input placeholder="" value="<%=nome%>" id="nome" name="nome" type="text" disabled>
                                    <label for="nome">Nome Completo</label>
                                </div>              
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Serviço</h6>
                            </div>

                            <div class="row">
                                <div>
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">attach_file</i>
                                        <select id="servico" name="servico" class="validate" required onchange="mostrarOpcoesParcelas(this.value)">
                                            <option value="" disabled selected>Serviços</option>
                                            <%
                                                ControleServico cs = new ControleServico();

                                                for (Servico servicos : cs.buscarTodosServicos()) {
                                                    if (servicos.isVisivel()) {
                                            %>
                                            <option value="<%=servicos.getTipoServico()%>"><%=servicos.getTipoServico()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <label>Selecione o serviço a ser prestado pelo aluno</label>
                                        <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                    </div>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Pagamento</h6>
                            </div>

                            <div class="center row">
                                <div id="infopg"></div>
                                <div id="preenpg">
                                    <div class="input-field col s4">
                                        <i class="material-icons prefix">attach_money</i>
                                        <input class="validate" required placeholder="" id="valorinicial" name="valorinicial" type="text" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true;
                                                else
                                                    return false;">
                                        <label for="valorinicial">Valor Total</label>
                                        <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                    </div>
                                </div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">attach_money</i>
                                    <input placeholder="" id="valorentrada" name="valorentrada" type="text" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                return true;
                                            else
                                                return false;">
                                    <label for="valorentrada">Valor de Entrada</label>
                                </div>
                                <div id="preenpar">
                                    <div class="input-field col s4">
                                        <i class="material-icons prefix">local_parking</i>
                                        <input placeholder="" id="parcelas" name="parcelas" type="text" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                return true;
                                            else
                                                return false;">
                                        <label for="parcelas">Parcelas</label>
                                    </div>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados Adicionais</h6>
                            </div>

                            <div class="center row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">description</i>
                                    <textarea placeholder="" name="anotacoes" class="materialize-textarea"></textarea>
                                    <label for="anotacoes">Anotações</label>
                                </div>              
                            </div>

                            <div class="center input-field col s12">
                                <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>

    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
                                        function inicializarSelects() {
                                            $('select').formSelect();
                                        }

                                        function inicializarDicas() {
                                            $('.tooltipped').tooltip();
                                        }

                                        $(document).ready(inicializarSelects());

                                        $(document).ready(inicializarDicas());

                                        function mostrarOpcoesParcelas(id) {
                                            var xhttp;
                                            xhttp = new XMLHttpRequest();
                                            xhttp.onreadystatechange = function () {
                                                if (this.readyState === 4 && this.status === 200) {
                                                    document.getElementById("infopg").innerHTML = this.responseText;
                                                    inicializarSelects();
                                                    inicializarDicas();
                                                    document.getElementById("preenpg").style.visibility = "hidden";
                                                    document.getElementById("preenpg").style.display = "none";
                                                    document.getElementById("preenpar").style.visibility = "hidden";
                                                    document.getElementById("preenpar").style.display = "none";
                                                }
                                            };
                                            xhttp.open("GET", "ajax/consultardadosservico.jsp?id=" + id, true);
                                            xhttp.send();
                                        }
    </script>
</html>
