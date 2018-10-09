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
        <title>Instrutor</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>


    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <table class="centered striped">
                <tr>
                    <th>Código</th>
                    <th>Nome Completo</th>
                    <th>Tipo de Instrução</th>
                    <th>Situação</th>

                    <th></th>
                    <th></th>

                </tr>
                <%
                    ControleInstrutor controleInstrutor = new ControleInstrutor();
                    List<Instrutor> instrutores = new ArrayList();
                    instrutores = controleInstrutor.buscarTodosInstrutores();

                    for (Instrutor instrutor : instrutores) {
                %>
                <tr>
                    <td><%=instrutor.getIdPessoa()%></td>
                    <td><%=instrutor.getNomeCompleto()%></td>
                    <td><%=instrutor.getTipoInstrucao()%></td>
                    <td><%=instrutor.getSituacao()%></td>
                    <td><a href="alterarInstrutor.jsp?idPessoa=<%=instrutor.getIdPessoa()%>" class="waves-effect waves-light btn" value="Alterar"> Alterar </a></td>
                    <td><a href="scripts/excluirinstrutor.jsp?idPessoa=<%=instrutor.getIdPessoa()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>
                </tr>

                <%
                    }
                %>
            </table>
            <br>

            <div class="row">
                <div class="center input-field col s6">
                    <a href="cadastrarInstrutor.jsp" class="waves-effect waves-light btn" type="submit">CADASTRAR</a>
                </div>
                <div class="center input-field col s6">
                    <a href="telaInicial.jsp" class="waves-effect waves-light btn" type="submit">VOLTAR</a>
                </div>
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>