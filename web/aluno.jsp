<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluno</title>
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
                    <th>Matrícula: </th>
                    <th>Nome Completo</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Data de Nascimento</th>
                    <th></th>

                    <th></th>
                    <th></th>

                </tr>
                <%
                    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                    ControleAluno controleAluno = new ControleAluno();
                    List<Aluno> alunos = new ArrayList();
                    alunos = controleAluno.buscarTodosAlunos();

                    for (Aluno aluno : alunos) {
                %>
                <tr>
                    <td><%=aluno.getIdPessoa()%></td>
                    <td><%=aluno.getNomeCompleto()%></td>
                    <td><%=aluno.getCpf()%></td>
                    <td><%=aluno.getRg()%></td>
                    <td><%=sdf1.format(aluno.getDataNascimento())%></td>
                    <td id="ver"><a href="mostrarAluno.jsp?idpessoa=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn-floating" value="verMais"><i class="material-icons">control_point</i></a></td>


                    <td><a href="alterarAluno.jsp?idpessoa=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn" value="Alterar"> Alterar </a></td>
                    <td><a href="scripts/excluiraluno.jsp?idpessoa=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>

                </tr>

                <%
                    }
                %>
            </table>
            <br>
            <div align="center">
            <a href="cadastrarAluno.jsp" class="waves-effect waves-light btn center"> 
                Cadastrar
            </a> 
            </div>
            <br>
            
            <div align="center">
                <a href="telainicial.jsp" class="waves-effect waves-light btn center"> 
                    Voltar
                </a> 
            </div>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
