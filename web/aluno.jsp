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
        <title>Alunos</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>

        <%

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

        label#noResultMessage {
            font-size: 30px;
        }

        table#tabelaAlunos thead {
            background-color: lightgrey;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <% if (p == 1) {  %>
            <div class="row">
                <a href="aluno.jsp?p=1" class="amber waves-effect waves-light btn col s6" value="AlunosOn" style="color: black;">Alunos com Processo em Andamento</a>
                <a href="aluno.jsp?p=2" class="grey lighten-5 waves-effect waves-light btn col s6" value="AlunosOff" style="color: gray;">Alunos com Processos Finalizados</a>
            </div>
            <% } else {%>
            <div class="row">
                <a href="aluno.jsp?p=1" class="grey lighten-5 waves-effect waves-light btn col s6" value="AlunosOn" style="color: gray;">Alunos com Processo em Andamento</a>
                <a href="aluno.jsp?p=2" class="amber waves-effect waves-light btn col s6" value="AlunosOff" style="color: black;">Alunos com Processos Finalizados</a>
            </div>
            <% }%>
            <br>
            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="row valign-wrapper">
                            <div class="center col s1">
                            </div>
                            <div class="center input-field col s8">
                                <input id="consultaN" name="consultaN" type="text"/>
                                <label for="consultaN"><i class="material-icons">search</i>Pesquisar aluno </label>
                                <input id="consultaNp" name="consultaNp" type="hidden" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;"/>
                                <label for="consultaNp"><i class="material-icons">search</i>Pesquisar aluno </label>
                                <input id="consultaC" name="consultaC" type="hidden" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;"/>
                                <label for="consultaC"><i class="material-icons">search</i>Pesquisar aluno </label>
                            </div>
                            <div class="left input-field col s3">
                                <p>
                                    <label>
                                        <input onclick="controleCB('cbNome');" id="cbNome" name="cbNome" type="checkbox" class="checkbox-red" checked="checked" />
                                        <span>Nome</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input onclick="controleCB('cbNumeroProcesso');" id="cbNumeroProcesso" name="cbNumeroProcesso" type="checkbox" />
                                        <span>Número de Processo</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input onclick="controleCB('cbCpf');" id="cbCpf" name="cbCpf" type="checkbox" />
                                        <span>CPF</span>
                                    </label>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <% if (p == 1) {  %>
                        <div class="card-image">
                            <a href="cadastrarAluno.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo aluno"><i class="material-icons">add</i></a>
                        </div>
                        <% } %>
                        <br>

                        <table id="tabelaAlunos" name="tabelaAlunos" class="centered striped">
                            <thead>
                                <tr>
                                    <th>Nº do Processo</th>
                                    <th>Nome Completo</th>
                                    <th>CPF</th>
                                    <th>RG</th>
                                    <th>Data de Nascimento</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <%
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                                ControleAluno controleAluno = new ControleAluno();
                                List<Aluno> alunos = controleAluno.buscarTodosAlunos();

                                for (Aluno aluno : alunos) {
                                    if (aluno.isVisivel() & p == 1) {
                            %>
                            <tbody>
                                <tr>
                                    <td id="numeroProcesso" name="numeroProcesso"><%=aluno.getProcesso()%></td>
                                    <td id="nome" name="nome"><%=aluno.getNomeCompleto()%></td>
                                    <td id="cpf" name="cpf"><%=aluno.getCpf()%></td>
                                    <td><%=aluno.getRg()%></td>
                                    <td><%=sdf.format(aluno.getDataNascimento())%></td>
                                    <td><a href="alterarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do aluno"><i class="material-icons">find_replace</i></button></td>
                                    <td><a href="mostrarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" value="MostrarAluno" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="abrir dados do aluno"><i class="material-icons">description</i></button></td>
                                </tr>
                            </tbody>
                            <%
                            } else if (!aluno.isVisivel() & p == 2) {
                            %>
                            <tbody>
                                <tr>
                                    <td id="numeroProcesso" name="numeroProcesso"><%=aluno.getProcesso()%></td>
                                    <td id="nome" name="nome"><%=aluno.getNomeCompleto()%></td>
                                    <td id="cpf" name="cpf"><%=aluno.getCpf()%></td>
                                    <td><%=aluno.getRg()%></td>
                                    <td><%=sdf.format(aluno.getDataNascimento())%></td>
                                    <td><a href="alterarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do aluno"><i class="material-icons">find_replace</i></button></td>
                                    <td><a href="mostrarAluno.jsp?idPessoa=<%=aluno.getIdPessoa()%>" value="MostrarAluno" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="abrir dados do aluno"><i class="material-icons">description</i></button></td>
                                </tr>
                            </tbody>

                            <%
                                    }
                                }
                            %>
                        </table>
                        <div align="center">
                            <label id="noResultMessage" name="noResultMessage">Nenhum aluno encontrado</label>
                        </div>
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

                                            $('input#consultaNp').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#numeroProcesso', noResults: "#noResultMessage"});
                                            $('input#consultaN').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#nome', noResults: "#noResultMessage"});
                                            $('input#consultaC').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#cpf', noResults: "#noResultMessage"});

                                            function controleCB(checkbox) {
                                                if (checkbox === "cbNumeroProcesso") {
                                                    if (document.getElementById("cbNumeroProcesso").checked === false) {
                                                        document.getElementById("cbNumeroProcesso").checked = true;
                                                    }
                                                    document.getElementById("cbNome").checked = false;
                                                    document.getElementById("cbCpf").checked = false;
                                                    document.getElementById("consultaNp").setAttribute("type", "text");
                                                    document.getElementById("consultaN").setAttribute("type", "hidden");
                                                    document.getElementById("consultaN").value = "";
                                                    document.getElementById("consultaC").setAttribute("type", "hidden");
                                                    document.getElementById("consultaC").value = "";
                                                }
                                                if (checkbox === "cbNome") {
                                                    if (document.getElementById("cbNome").checked === false) {
                                                        document.getElementById("cbNome").checked = true;
                                                    }
                                                    document.getElementById("cbNumeroProcesso").checked = false;
                                                    document.getElementById("cbCpf").checked = false;
                                                    document.getElementById("consultaNp").setAttribute("type", "hidden");
                                                    document.getElementById("consultaNp").value = "";
                                                    document.getElementById("consultaN").setAttribute("type", "text");
                                                    document.getElementById("consultaC").setAttribute("type", "hidden");
                                                    document.getElementById("consultaC").value = "";
                                                }
                                                if (checkbox === "cbCpf") {
                                                    if (document.getElementById("cbCpf").checked === false) {
                                                        document.getElementById("cbCpf").checked = true;
                                                    }
                                                    document.getElementById("cbNome").checked = false;
                                                    document.getElementById("cbNumeroProcesso").checked = false;
                                                    document.getElementById("consultaNp").setAttribute("type", "hidden");
                                                    document.getElementById("consultaNp").value = "";
                                                    document.getElementById("consultaN").setAttribute("type", "hidden");
                                                    document.getElementById("consultaN").value = "";
                                                    document.getElementById("consultaC").setAttribute("type", "text");
                                                }
                                            }

                                            function fMasc(objeto, mascara) {
                                                obj = objeto;
                                                masc = mascara;
                                                setTimeout("fMascEx()", 1);
                                            }
                                            function fMascEx() {
                                                obj.value = masc(obj.value);
                                            }

                                            function mCPF(cpf) {
                                                cpf = cpf.replace(/\D/g, "");
                                                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                                                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                                                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
                                                return cpf;
                                            }

    </script>

</html>
