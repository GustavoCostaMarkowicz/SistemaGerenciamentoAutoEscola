<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instrutores</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        label#noResultMessage {
            font-size: 30px;
        }

        table#tabelaInstrutores thead {
            background-color: lightgrey;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>

            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="row valign-wrapper">
                            <div class="center col s1">
                            </div>
                            <div class="center input-field col s10">
                                <input id="consulta" name="consulta" type="text"/>
                                <label for="consulta"><i class="material-icons">search</i>Pesquisar instrutor </label>
                            </div>
                            <div class="center col s1">
                            </div>
                        </div>
                    </div>
                    <div class="card">
                <div class="card-image">
                    <a href="cadastrarInstrutor.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo instrutor"><i class="material-icons">add</i></a>
                </div>
                <table id="tabelaInstrutores" name="tabelaInstrutores" class="centered striped">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome Completo</th>
                            <th>Tipo de Instrução</th>
                            <th>Situação</th>

                            <th></th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ControleInstrutor controleInstrutor = new ControleInstrutor();
                            List<Instrutor> instrutores = new ArrayList();
                            instrutores = controleInstrutor.buscarTodosInstrutores();

                            for (Instrutor instrutor : instrutores) {
                                if (instrutor.isVisivel()) {
                        %>
                        <tr>
                            <td><%=instrutor.getIdPessoa()%></td>
                            <td><%=instrutor.getNomeCompleto()%></td>
                            <td><%=instrutor.getTipoInstrucao()%></td>
                            <td><%=instrutor.getSituacao()%></td>
                            <td><a href="alterarInstrutor.jsp?idPessoa=<%=instrutor.getIdPessoa()%>" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do instrutor"><i class="material-icons">find_replace</i></button></td>
                            <td><a href="scripts/excluirinstrutor.jsp?idPessoa=<%=instrutor.getIdPessoa()%>" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir instrutor"><i class="material-icons">delete_sweep</i></button></td>
                        </tr>

                        <%
                                }

                            }
                        %>
                    </tbody>
                </table>
                <div align="center">
                    <label id="noResultMessage" name="noResultMessage">Nenhum instrutor encontrado</label>
                </div>    
                <br>
            </div>
                </div>
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>

    </body>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.tooltipped');
            var instances = M.Tooltip.init(elems, options);
        });

        // Or with jQuery

        $(document).ready(function () {
            $('.tooltipped').tooltip();
        });

        $('input#consulta').quicksearch('table#tabelaInstrutores tbody tr', {noResults: "#noResultMessage"});
    </script>

</html>