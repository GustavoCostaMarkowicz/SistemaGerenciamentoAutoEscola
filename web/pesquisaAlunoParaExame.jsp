<%-- 
    Document   : pesquisaAlunoParaExame
    Created on : 26/08/2019, 12:18:47
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
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

    </head>
    <%

        int tipoExame = Integer.parseInt(request.getParameter("tipoExame"));


    %>

    <style>

        div#cartao {
            bottom: -15px;
        }


    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>
            <br>
            <br>
            <br>

            <div class="card">
                <div class="card-content">

                    <div class="card-stacked">
                        <div class="card-content">
                            <div class="row">
                                <div class="col s14 m12">
                                    <div class="card">
                                        <div class="row valign-wrapper">
                                            <div class="center col s1">
                                            </div>
                                            <div class="center input-field col s8">
                                                <input id="consultaN" name="consultaN" maxlength="1" type="text" onkeyup="atualizarTabela(1, <%=tipoExame%>);"/>
                                                <label for="consultaN"><i class="material-icons">search</i>Pesquisar aluno </label>
                                                <input id="consultaM" name="consultaM" type="hidden" onkeyup="atualizarTabela(2, <%=tipoExame%>);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                            return true;
                                                        else
                                                            return false;"/>
                                                <label for="consultaNp"><i class="material-icons">search</i>Pesquisar aluno </label>
                                                <input id="consultaC" name="consultaC" onkeyup="atualizarTabela(3, <%=tipoExame%>);" type="hidden" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                            return true;
                                                        else
                                                            return false;"/>
                                                <label for="consultaC"><i class="material-icons">search</i>Pesquisar aluno </label>
                                            </div>
                                            <div class="left input-field col s3">
                                                <p>
                                                    <label>
                                                        <input onclick="controleCB('cbNome');" id="cbNome" name="cbNome" type="checkbox" class="filled-in" checked="checked" />
                                                        <span>Nome</span>
                                                    </label>
                                                </p>
                                                <p>
                                                    <label>
                                                        <input onclick="controleCB('cbMatricula');" id="cbMatricula" name="cbMatricula" type="checkbox" class="filled-in" />
                                                        <span>Matrícula</span>
                                                    </label>
                                                </p>
                                                <p>
                                                    <label>
                                                        <input onclick="controleCB('cbCpf');" id="cbCpf" name="cbCpf" type="checkbox" class="filled-in" />
                                                        <span>CPF</span>
                                                    </label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="tabelaAtualizar">

                                    </div>

                                </div>
                            </div>
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
        <script>
                
                                                            
                                                            

                                                             document.addEventListener('DOMContentLoaded', function () {
                                                                var elems = document.querySelectorAll('.tooltipped');
                                                                var instances = M.Tooltip.init(elems, options);
                                                            });

                                                            // Or with jQuery

                                                            $(document).ready(function () {
                                                                $('.tooltipped').tooltip();
                                                            });

                                                            

                                                            function controleCB(checkbox) {

                                                                if (checkbox === "cbMatricula") {
                                                                    if (document.getElementById("cbMatricula").checked === false) {
                                                                        document.getElementById("cbMatricula").checked = true;
                                                                    }
                                                                    document.getElementById("cbNome").checked = false;
                                                                    document.getElementById("cbCpf").checked = false;
                                                                    document.getElementById("consultaM").setAttribute("type", "text");
                                                                    document.getElementById("consultaN").setAttribute("type", "hidden");
                                                                    document.getElementById("consultaN").value = "";
                                                                    document.getElementById("consultaC").setAttribute("type", "hidden");
                                                                    document.getElementById("consultaC").value = "";
                                                                }
                                                                if (checkbox === "cbNome") {
                                                                    if (document.getElementById("cbNome").checked === false) {
                                                                        document.getElementById("cbNome").checked = true;
                                                                    }
                                                                    document.getElementById("cbMatricula").checked = false;
                                                                    document.getElementById("cbCpf").checked = false;
                                                                    document.getElementById("consultaM").setAttribute("type", "hidden");
                                                                    document.getElementById("consultaM").value = "";
                                                                    document.getElementById("consultaN").setAttribute("type", "text");
                                                                    document.getElementById("consultaC").setAttribute("type", "hidden");
                                                                    document.getElementById("consultaC").value = "";
                                                                }
                                                                if (checkbox === "cbCpf") {
                                                                    if (document.getElementById("cbCpf").checked === false) {
                                                                        document.getElementById("cbCpf").checked = true;
                                                                    }
                                                                    document.getElementById("cbNome").checked = false;
                                                                    document.getElementById("cbMatricula").checked = false;
                                                                    document.getElementById("consultaM").setAttribute("type", "hidden");
                                                                    document.getElementById("consultaM").value = "";
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

                                                            var contadorTab = 0;

                                                            function atualizarTabela(tipoCampo, tipoExame) {

                                                                if (contadorTab !== 0) {
                                                                    if (tipoCampo === 1) {
                                                                        if (document.getElementById("consultaN").value === "") {
                                                                            document.getElementById("tabelaAtualizar").innerHTML = "";
                                                                            contadorTab = 0;
                                                                        }
                                                                    }
                                                                    if (tipoCampo === 2) {
                                                                        if (document.getElementById("consultaM").value === "") {
                                                                            document.getElementById("tabelaAtualizar").innerHTML = "";
                                                                            contadorTab = 0;
                                                                        }
                                                                    }
                                                                    if (tipoCampo === 3) {
                                                                        if (document.getElementById("consultaC").value === "") {
                                                                            document.getElementById("tabelaAtualizar").innerHTML = "";
                                                                            contadorTab = 0;
                                                                        }
                                                                    }
                                                                } else {
                                                         
                                                                    contadorTab++;
                                                                    var letra = document.getElementById("consultaN").value;
                                                                    var xhttp;
                                                                    xhttp = new XMLHttpRequest();
                                                                    xhttp.onreadystatechange = function () {
                                                                        if (this.readyState === 4 && this.status === 200) {
                                                                            document.getElementById("tabelaAtualizar").innerHTML = this.responseText;
                                                                            $('input#consultaM').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#matricula', noResults: "#noResultMessage"});
                                                                            $('input#consultaN').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#nome', noResults: "#noResultMessage"});
                                                                            $('input#consultaC').quicksearch('table#tabelaAlunos tbody tr', {'selector': 'td#cpf', noResults: "#noResultMessage"});
                                                                            document.getElementById("consultaN").setAttribute('maxlength','10');

                                                                        }
                                                                    };
                                                                    xhttp.open("GET", "ajax/atualizartabelapesquisaalunoexame.jsp?tipoExame=" + tipoExame + "&letra=" + letra, true);
                                                                    xhttp.send();
                                                                }
                                                            }




        </script>

    </body>
</html>
