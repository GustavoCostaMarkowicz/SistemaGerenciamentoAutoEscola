<%-- 
    Document   : mostrarAluno
    Created on : 02/10/2018, 21:40:04
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações do Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        body {
            background-color: lightgrey;
        }

        .card {
            margin-top: 20px;
            background-color: gray;
            border-radius: 15px;
            align-items: center;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%

            int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idPessoa);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            boolean teste = a.isDoadorOrgaos();
            String sDoadorOrgaos;

            if (teste == true) {
                sDoadorOrgaos = "Sim";
            } else {
                sDoadorOrgaos = "Não";
            }

        %>
        <div class="card">
            <div class="card-content" align="center">
                <span class="card-title activator grey-text text-darken-4"><p><%=a.getNomeCompleto()%></p></span>
                        <%
                            if (ca.buscarContaAluno(a.getIdPessoa()) == null) {
                        %>
                <div class="row">
                    <div class="center input-field col s12">
                        <a href="cadastrarConta.jsp?idPessoa=<%=a.getIdPessoa()%>" class="green waves-effect waves-light btn" type="submit">CADASTRAR CONTA</a>
                    </div>
                <%
                } else {
                %>
                <div class="row">
                    <div class="center input-field col s12">
                        <a href="mostrarConta.jsp?idPessoa=<%=a.getIdPessoa()%>" class="amber waves-effect waves-light btn" type="submit" style="color: black;">MOSTRAR CONTA</a>
                    </div>


                <%
                    }
                %>

                <%
                    if (a.isVisivel()) {
                %>

                    <div class="center input-field col s12">
                        <a href="scripts/finalizarprocesso.jsp?idPessoa=<%=a.getIdPessoa()%>&id=1" class="red waves-effect waves-light btn" type="submit">FINALIZAR PROCESSO</a>
                    </div>
                </div>

                <%
                } else {
                %>

                    <div class="center input-field col s12">
                        <a href="scripts/finalizarprocesso.jsp?idPessoa=<%=a.getIdPessoa()%>&id=2" class="green waves-effect waves-light btn" type="submit">ABRIR UM NOVO PROCESSO</a>
                    </div>
                </div>

                <%
                    }
                %>

                <p>Número do Processo: <%=a.getProcesso()%></p>
                <p>Data de Nascimento: <%=sdf.format(a.getDataNascimento())%></p>
                <p>Data de Cadastro: <%=sdf.format(a.getDataCadastro())%></p>
                <p>CPF: <%=a.getCpf()%></p>
                <p>RG: <%=a.getRg()%></p>
                <p>Órgão Emissor do RG: <%=a.getOrgaoRg()%></p>
                <p>Sexo: <%=a.getSexo()%></p>
                <p>Nome do Pai: <%=a.getNomePai()%></p>
                <p>Nome da Mãe: <%=a.getNomeMae()%></p>
                <p>Cidade: <%=a.getCidade()%></p>
                <p>Estado: <%=a.getEstado()%></p>
                <p>Endereço: <%=a.getEndereco()%></p>
                <p>Número: <%=a.getNumero()%></p>
                <p>Complemento: <%=a.getComplemento()%></p>
                <p>Cep: <%=a.getCep()%></p>
                <p>Bairro: <%=a.getBairro()%></p>
                <p>Telefone: <%=a.getTelefone()%></p>
                <p>Telefone-Celular: <%=a.getTelefoneCelular()%></p>
                <p>Unidade Federativa: <%=a.getUf()%></p>
                <p>Estado Civil: <%=a.getEstadoCivil()%></p>
                <p>Naturalidade: <%=a.getNaturalidade()%></p>
                <p>Nacionalidade: <%=a.getNacionalidade()%></p>
                <p>Grau de Instrução: <%=a.getGrauInstrucao()%></p>
                <p>Doador de Órgãos: <%=sDoadorOrgaos%></p>
                <p>Tipo Sanguíneo: <%=a.getTipoSanguineo()%></p>
                <p>Email: <%=a.getEmail()%></p>
            </div>

        </div>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>
</html>
