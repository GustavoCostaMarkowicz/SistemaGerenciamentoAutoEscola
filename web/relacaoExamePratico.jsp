
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exame Prático</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        a {
            color: white;
        }

    </style>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <table class="centered striped">
                <tr>
                    <th>Categoria </th>
                    <th>Instrutor</th>
                    <th>Veículo</th>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>

                    <th></th>
                    <th></th>

                </tr>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
                    ControleExamePratico cep = new ControleExamePratico();
                    List<ExamePratico> eps = new ArrayList();
                    eps = cep.buscarTodosExamePraticos();

                   

                    for (ExamePratico ep : eps) {
                     
                    boolean teste = ep.isReteste();
                    String steste;
                    
                    if(teste == true){
                        steste = "Sim";
                    } else {
                        steste = "Não";
                    }

                %>
                <tr>
                    <td><%=ep.getCategoria() %></td>
                    <td><%=ep.getInstrutor().getNomeCompleto() %></td>
                    <td><%=ep.getVeiculo().getModelo() %></td>
                    <td><%=sdf.format(ep.getDataExame())%></td>
                    <td><%=sdf1.format(ep.getHorarioExame())%></td>
                    <td><%=steste%></td>

                    <td><a href="relacaoResultadoExame.jsp?idexame=<%=ep.getIdExame()%>" class="waves-effect waves-light btn" value="AlunosExame"> Alunos </a></td>
                    <td><a href="scripts/excluirexamepratico.jsp?idexamepratico=<%=ep.getIdExame()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>

                </tr>

                <%
                    }
                %>
            </table>
            <br>

            <div class="row">
                <div class="center input-field col s6">
                   <a href="cadastrarExamePratico.jsp"><button class="waves-effect waves-light btn" type="button">CADASTRAR</button></a>
                </div>
                <div class="center input-field col s6">
                    <button class="waves-effect waves-light btn" type="button"><a href="telaInicial.jsp">VOLTAR</a></button>
                </div>
                
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>