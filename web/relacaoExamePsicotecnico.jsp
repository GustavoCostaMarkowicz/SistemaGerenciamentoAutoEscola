
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exame Psicotécnico</title>
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
                    <th>Nome do Aluno </th>
                    <th>Psicólogo</th>
                    <th>Clínica</th>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>

                    <th></th>

                </tr>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
                    ControleExamePsicotecnico cep = new ControleExamePsicotecnico();
                    List<ExamePsicotecnico> eps = new ArrayList();
                    eps = cep.buscarTodosExamePsicotecnicos();

                   

                    for (ExamePsicotecnico ep : eps) {
                     
                    boolean teste = ep.isReteste();
                    String steste;
                    
                    if(teste == true){
                        steste = "Sim";
                    } else {
                        steste = "Não";
                    }

                %>
                <tr>
                    <td width="200px"><%for (Aluno aluno : ep.getAlunos()) {
                        %>    <p><%=aluno.getNomeCompleto() %></p>
                        <%}%></td>
                    <td><%=ep.getPsicologo() %></td>
                    <td><%=ep.getClinica()%></td>
                    <td><%=sdf.format(ep.getDataExame())%></td>
                    <td><%=sdf1.format(ep.getHorarioExame())%></td>
                    <td><%=steste%></td>


                    <td><a href="scripts/excluirexamepsicotecnico.jsp?idexamepsico=<%=ep.getIdExame()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>

                </tr>

                <%
                    }
                %>
            </table>
            <br>

            <div class="row">
                <div class="center input-field col s6">
                   <a href="cadastrarExamePsicotecnico.jsp"><button class="waves-effect waves-light btn" type="button">CADASTRAR</button></a>
                </div>
                <div class="center input-field col s6">
                    <button class="waves-effect waves-light btn" type="button"><a href="telainicial.jsp">VOLTAR</a></button>
                </div>
                
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
