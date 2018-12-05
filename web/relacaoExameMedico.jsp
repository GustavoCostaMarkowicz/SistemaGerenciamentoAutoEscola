<%-- 
    Document   : relacaoExameMedico
    Created on : 06/10/2018, 23:33:58
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exame Médico</title>
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
                    <th>Aluno </th>
                    <th>Médico Responsável</th>
                    <th>Clínica</th>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>
                    <th>Resultado do Exame</th>

                    <th></th>

                </tr>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
                    ControleExameMedico cem = new ControleExameMedico();
                    List<ExameMedico> ems = new ArrayList();
                    ems = cem.buscarTodosExameMedicos();

                    

                    for (ExameMedico em : ems) {
                     
                    ControleResultadoExame cre = new ControleResultadoExame();
                    ResultadoExame re = cre.buscarResultadoExamesPorAlunoExame(em.getAlunos().get(0).getIdPessoa(), em.getIdExame());
                    String resultado;
                    if(re == null){
                        resultado = "Indefinido";
                    } else{
                        resultado = re.getResultado();
                    }

                    
                    boolean teste = em.isReteste();
                    String steste;
                    
                    if(teste == true){
                        steste = "Sim";
                    } else {
                        steste = "Não";
                    }

                %>
                <tr>
                    <td width="200px"><%for (Aluno aluno : em.getAlunos()) {
                        %>    <p><%=aluno.getNomeCompleto() %></p>
                        <%}%></td>
                    <td><%=em.getMedico()%></td>
                    <td><%=em.getClinica()%></td>
                    <td><%=sdf.format(em.getDataExame())%></td>
                    <td><%=sdf1.format(em.getHorarioExame())%></td>
                    <td><%=steste%></td>
                    <%
                        if(resultado.equals("Indefinido")){
                            %><td><a href="cadastrarResultadoExame.jsp?idexame=<%=em.getIdExame()%>" class="waves-effect waves-light btn-floating" value="AdicionarResultado"><i class="material-icons">control_point</i></a></td><%
                        } else{
                        %><td><%=resultado%></td> <%
}
                    %>

                    <td><a href="scripts/excluirexamemedico.jsp?idexamemedico=<%=em.getIdExame()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>

                </tr>

                <%
                    }
                %>
            </table>
            <br>

            <div class="row">
                <div class="center input-field col s6">
                    <button class="waves-effect waves-light btn" type="button"><a href="cadastrarExameMedico.jsp">CADASTRAR</a></button>
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
