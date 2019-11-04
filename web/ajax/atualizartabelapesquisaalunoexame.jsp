<%-- 
    Document   : atualizartabelapesquisaalunoexame
    Created on : 02/09/2019, 11:39:05
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String letra = request.getParameter("letra");
    String stipoExame = request.getParameter("tipoExame");
    int tipoExame = Integer.parseInt(stipoExame);
    String link = "";

    if (tipoExame == 1) {
        link = "cadastrarExameMedico.jsp";
    } else if (tipoExame == 2) {
        link = "cadastrarExamePsicotecnico.jsp";
    } else if (tipoExame == 3) {
        link = "cadastrarExameTeorico.jsp";
    } else {
        link = "cadastrarExamePratico.jsp";
    }


%>
<div class="card" id="tabelaAtualizar">

    <br>

    <table id="tabelaAlunos" name="tabelaAlunos" class="centered striped">
        <thead>
            <tr>
                <th>Matrícula</th>
                <th>Nº do Processo</th>
                <th>Nome Completo</th>
                <th>CPF</th>
                <th>RG</th>
                <th>Data de Nascimento</th>
                <th></th>

            </tr>
        </thead>
        <%            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            ControleAluno controleAluno = new ControleAluno();
            List<Aluno> alunos = controleAluno.buscarTodosAlunos();
           // List<Aluno> alunoPendente = controleAluno.buscarAlunoComExamePendente();

            for (Aluno aluno : alunos) {

               // if (aluno.isVisivel()) {
                   // if (alunoPendente.contains(aluno)) {
                        if (aluno.getNomeCompleto().toLowerCase().contains(letra.toLowerCase())) {

        %>
        <tbody>
            <tr>
                <td id="matricula" name="matricula"><%=aluno.getIdPessoa()%></td>
                <td><%=aluno.getProcesso()%></td>
                <td id="nome" name="nome"><%=aluno.getNomeCompleto()%></td>
                <td id="cpf" name="cpf"><%=aluno.getCpf()%></td>
                <td><%=aluno.getRg()%></td>
                <td><%=sdf.format(aluno.getDataNascimento())%></td>
                <td>

                    <a href="<%=link%>?idAluno=<%=aluno.getIdPessoa()%>" class="waves-effect waves-light btn"> Cadastrar </a>

                </td>
            </tr>
        </tbody>
        <%

                        //}
                    //}

                }
            }
        %>
    </table>
</div>
