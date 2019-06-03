<%-- 
    Document   : escolhaExame
    Created on : 06/10/2018, 16:04:31
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>

        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");

            ControleUsuario cu = new ControleUsuario();
            String tipoUsuario = cu.verificarTipoUsuario(u.getIdUsuario());

            int p = 1;
            if (request.getParameter("p") != null) {
                p = Integer.parseInt(request.getParameter("p"));
            }
        %>

    </head>

    <style>

        a {
            color: white;
        }

        body {

            display: flex;
            min-height: 100vh;
            flex-direction: column;

        }

        main {
            flex: 1 0 auto;
        }

        label#noResultMessage {
            font-size: 30px;
        }

        table#tabelaFuncionarios thead {
            background-color: lightgrey;
        }

    </style>

    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%if (tipoUsuario.equals("diretor")) {%>
            <% if (p == 1) {  %>
            <div class="row">
                <a href="funcionario.jsp?p=1" class="amber waves-effect waves-light btn col s6" value="Instrutor" style="color: black;">Instrutores</a>
                <a href="funcionario.jsp?p=2" class="grey lighten-5 waves-effect waves-light btn col s6" value="Atendente" style="color: gray;">Atendentes</a>
            </div>
            <% } else {%>
            <div class="row">
                <a href="funcionario.jsp?p=1" class="grey lighten-5 waves-effect waves-light btn col s6" value="Instrutor" style="color: gray;">Instrutores</a>
                <a href="funcionario.jsp?p=2" class="amber waves-effect waves-light btn col s6" value="Atendente" style="color: black;">Atendentes</a>
            </div>
            <% }%>           
            <%}%>

            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="row valign-wrapper">
                            <div class="center col s1">
                            </div>
                            <%if (p == 1) {%>
                            <div class="center input-field col s10">
                                <input id="consulta" name="consulta" type="text"/>
                                <label for="consulta"><i class="material-icons">search</i>Pesquisar instrutor </label>
                            </div>
                            <%} else {%>
                            <div class="center input-field col s10">
                                <input id="consulta" name="consulta" type="text"/>
                                <label for="consulta"><i class="material-icons">search</i>Pesquisar atendente </label>
                            </div>
                            <%}%>
                            <div class="center col s1">
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <%if (p == 1) {%>
                        <div class="card-image">
                            <a href="cadastrarInstrutor.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo instrutor"><i class="material-icons">add</i></a>
                        </div>
                        <table id="tabelaFuncionarios" name="tabelaFuncionarios" class="centered striped">
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
                        <%} else {%>
                        <div class="card-image">
                            <a href="cadastrarUsuario.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo atendente"><i class="material-icons">add</i></a>
                        </div>
                        <table id="tabelaFuncionarios" name="tabelaFuncionarios" class="centered striped">
                            <thead>
                                <tr>
                                    <th>Nome Completo</th>
                                    <th>Usuário</th>
                                    <th>Cidade de Atuação</th>
                                    <th>Telefone</th>
                                    <th>Telefone Celular</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                                    ControleAtendente ca = new ControleAtendente();
                                    List<Atendente> atendentes = ca.buscarTodosAtendentes();
                                    
                                    String cidadeAtuacao = "";
                                    String telefone = "";
                                    String telefoneCelular = "";

                                    for (Atendente atendente : atendentes) {
                                        if(atendente.getCidadeAtuacao() != null){
                                            cidadeAtuacao = atendente.getCidadeAtuacao();
                                        }
                                        if(atendente.getTelefone() != null){
                                            telefone = atendente.getTelefone();
                                        }
                                        if(atendente.getTelefoneCelular() != null){
                                            telefoneCelular = atendente.getTelefoneCelular();
                                        }
                                        if (atendente.isVisivel()) {
                                %>
                                <tr>
                                    <td><%=atendente.getNomeCompleto()%></td>
                                    <td><%=atendente.getLogin()%></td>
                                    <td><%=cidadeAtuacao%></td>
                                    <td><%=telefone%></td>
                                    <td><%=telefoneCelular%></td>
                                    <td><a href="alterarUsuario.jsp?idusuario=<%=atendente.getIdUsuario()%>" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do atendente"><i class="material-icons">find_replace</i></button></td>
                                    <td><a href="scripts/excluiratendente.jsp?idusuario=<%=atendente.getIdUsuario()%>" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir atendente"><i class="material-icons">delete_sweep</i></button></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <div align="center">
                            <label id="noResultMessage" name="noResultMessage">Nenhum atendente encontrado</label>
                        </div>
                        <%}%>
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

        $('input#consulta').quicksearch('table#tabelaFuncionarios tbody tr', {noResults: "#noResultMessage"});
    </script>

</html>
