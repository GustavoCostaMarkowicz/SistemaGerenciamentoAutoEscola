<%-- 
    Document   : escolhaExame
    Created on : 06/10/2018, 16:04:31
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exames</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>

        <%
            int p = 1;
            if (request.getParameter("p") != null) {
                p = Integer.parseInt(request.getParameter("p"));
            } else {
                p = 1;
            }

            ControleExame ce = new ControleExame();
            List<Exame> exames = ce.buscarTodosExames();
            int qtdE;
            String div = "";

            Date dataAtual = new Date();
            int mes = dataAtual.getMonth();
            //diaF = último dia do mês
            int diaF = 0;
            //mesC = mês atual em String
            String mesC = "";
            //Testes para determinar a variável 'diaF'
            if (mes == 0) {
                diaF = 31;
                mesC = "Janeiro";
            }
            if (mes == 1) {
                //Teste de ano bissexto
                if ((dataAtual.getYear() + 1900) % 4 == 0 & ((dataAtual.getYear() + 1900) % 100 != 0 | (dataAtual.getYear() + 1900) % 400 == 0)) {
                    diaF = 29;
                } else {
                    diaF = 28;
                }
                mesC = "Fevereiro";
            }
            if (mes == 2) {
                diaF = 31;
                mesC = "Março";
            }
            if (mes == 3) {
                diaF = 30;
                mesC = "Abril";
            }
            if (mes == 4) {
                diaF = 31;
                mesC = "Maio";
            }
            if (mes == 5) {
                diaF = 30;
                mesC = "Junho";
            }
            if (mes == 6) {
                diaF = 31;
                mesC = "Julho";
            }
            if (mes == 7) {
                diaF = 31;
                mesC = "Agosto";
            }
            if (mes == 8) {
                diaF = 30;
                mesC = "Setembro";
            }
            if (mes == 9) {
                diaF = 31;
                mesC = "Outubro";
            }
            if (mes == 10) {
                diaF = 30;
                mesC = "Novembro";
            }
            if (mes == 11) {
                diaF = 31;
                mesC = "Dezembro";
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

        table#calendario thead{
            background-color: black;
            color: white;
            font-size: 17px;
        }

        table#calendario td {
            border-right: solid 1px lightgrey; 
            border-left: solid 1px lightgrey;
            font-size: 22px;
        }

        div.dia {
            color: black;
        }

        td.menu:hover {
            background-color:rgb(179,255,179);
        }

        label.prchto {
            font-size: 17px;
            visibility: hidden;
        }

        label.dataEx {
            color: green;
            font-size: 15px;
        }

        div#titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        label#noResultMessage {
            font-size: 30px;
            color: gray;
        }

        table#tabelaExames thead {
            background-color: lightgrey;
        }

    </style>

    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <div class="row">
                <a href="pesquisaAlunoParaExame.jsp?tipoExame=1" class="amber waves-effect waves-light btn col s3" value="ExMed" style="color: black;">Exame Médico</a>
                <a href="pesquisaAlunoParaExame.jsp?tipoExame=2" class="amber waves-effect waves-light btn col s3" value="ExPsi" style="color: black;">Exame Psicotécnico</a>
                <a href="pesquisaAlunoParaExame.jsp?tipoExame=3" class="amber waves-effect waves-light btn col s3" value="ExTeo" style="color: black;">Exame Teórico</a>
                <a href="pesquisaAlunoParaExame.jsp?tipoExame=4" class="amber waves-effect waves-light btn col s3" value="ExPra" style="color: black;">Exame Prático</a>
            </div>
            <%if(p == 1){%>
            <div class="row">
                <a href="exame.jsp?p=2" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Gerar Relatórios</a>
                <a href="exame.jsp?p=1" class="red lighten-1 waves-effect waves-light btn col s6" value="">Exibir Calendário</a>
            </div>
            <%}else{%>
            <div class="row">
                <a href="exame.jsp?p=2" class="red lighten-1 waves-effect waves-light btn col s6" value="">Gerar Relatórios</a>
                <a href="exame.jsp?p=1" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Exibir Calendário</a>
            </div>
            <%}%>
            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-content">
                            <%if (p == 1) {%>
                            <div id="titulo" class="amber">
                                <h6 align="center">Consulta de Exames</h6>
                                <h5 align="center"><%=mesC%> <%=new Date().getYear() + 1900%></h5>
                            </div>
                            <table id="calendario" name="calendario" class="highlight centered">
                                <thead>
                                    <tr>
                                        <th>Domingo</th>
                                        <th>Segunda</th>
                                        <th>Terça<label class="prchto">BB</label></th>
                                        <th>Quarta<label class="prchto">B</label></th>
                                        <th>Quinta<label class="prchto">B</label></th>
                                        <th>Sexta<label class="prchto">BB</label></th>
                                        <th>Sábado<label class="prchto">B</label></th>
                                    </tr>
                                </thead>
                                <%
                                    //diaNAtual = dia atual do mês
                                    int diaNAtual = dataAtual.getDate();
                                    //diaSAtual = dia atual da semana
                                    int diaSAtual = dataAtual.getDay();
                                    //dia = contador de dias
                                    int dia = 1;
                                    //diaSP = dia da semana do primeiro dia do mês
                                    int diaSP;
                                    int i;
                                    int flag = 0;
                                    //Testes para definir a variável 'diaSP'
                                    if (diaNAtual != 1) {
                                        for (i = diaNAtual; i > 1; i -= 7) {
                                        }
                                        if (i != 1) {
                                            for (i = i; i < 1; i++) {
                                                flag++;
                                            }
                                            diaSP = (diaSAtual + flag) % 7;
                                        } else {
                                            diaSP = diaSAtual;
                                        }
                                    } else {
                                        diaSP = diaSAtual;
                                    }

                                %>
                                <tbody>
                                    <%
                                        //diaSControle = controla o valor do dia da semana
                                        int diaSControle = diaSP;
                                        //Inicia o preenchimento do calendário com a condição de parada de 'j' ser != 0
                                        for (int j = 0; j == 0;) {
                                    %>
                                    <tr>
                                        <%
                                            //Preenche a primeira linha do calendário
                                            if (dia == 1) {
                                                //Preenche os espaços vazios correspondentes aos dias do mês anterior
                                                for (int k = 0; k < diaSControle; k++) {
                                        %>
                                        <td></td> 
                                        <%
                                            }
                                            //Preenche a primeira linha a partir do primeiro dia do mês até sábado
                                            for (int k = diaSControle; k <= 6; k++) {
                                                //qtdE = quantidade de exames em um determinado dia
                                                qtdE = 0;
                                                //Verifica a quantidade de exames para o dia do mês em execução
                                                for (Exame e : exames) {
                                                    if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                        qtdE++;
                                                    }
                                                }
                                                //div = texto à ser mostrado na tela com a quantidade de exames do dia do mês em execução
                                                if (qtdE == 1) {
                                                    div = String.valueOf(qtdE) + " exame";
                                                } else {
                                                    div = String.valueOf(qtdE) + " exames";
                                                }
                                                //Verifica se o dia do mês em execução possui exames cadastrados
                                                if (qtdE > 0) {
                                                //Caso sim: mostra um campo da tabela com a quantidade de exames naquele determinado dia
                                        %>
                                        <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                                                    <%
                                                        dia++;
                                                    } else {
                                                    //Caso não: mostra um campo padrão da tabela
                                                    %>
                                        <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                                            <%
                                                        dia++;
                                                    }
                                                }
                                            //Preenche as demais linhas do calendário
                                            } else {
                                                //Inicia o preenchimento da linha de domingo à sábado
                                                for (int k = diaSControle; k <= 6; k++) {
                                                    //Verifica se o dia do mês em execução é o último do mês
                                                    if (dia == diaF) {
                                                        //Caso sim: preenche o último dia no calendário pelo mesmo método da linha do primeiro dia
                                                        qtdE = 0;
                                                        for (Exame e : exames) {
                                                            if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                                qtdE++;
                                                            }
                                                        }
                                                        if (qtdE == 1) {
                                                            div = String.valueOf(qtdE) + " exame";
                                                        } else {
                                                            div = String.valueOf(qtdE) + " exames";
                                                        }
                                                        if (qtdE > 0) {
                                            %><td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> <%
                                            } else {
                                                    %>
                                        <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                                            <%
                                                }
                                                //Testa se o último dia do mês é sábado
                                                if (k < 6) {
                                                    //Caso não: preenche os dias da semana com campos vazios até sábado
                                                    while (k < 6) {
                                            %><td></td><%
                                                        k++;
                                                    }
                                                }
                                                dia++;
                                            } else {
                                                //Caso não: preenche todos os dias do calendário que estão entre a primeira e a última linha, pelo mesmo método da linha do primeiro dia 
                                                qtdE = 0;
                                                for (Exame e : exames) {
                                                    if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                        qtdE++;
                                                    }
                                                }
                                                if (qtdE == 1) {
                                                    div = String.valueOf(qtdE) + " exame";
                                                } else {
                                                    div = String.valueOf(qtdE) + " exames";
                                                }
                                                if (qtdE > 0) {
                                        %>
                                        <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                                                    <%
                                                        dia++;
                                                    } else {
                                                    %>
                                        <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                                            <%
                                                                dia++;

                                                            }
                                                        }
                                                    }
                                                }
                                                //Define diaScontrole como domingo
                                                diaSControle = 0;
                                                //Verifica se o dia do mês em execução é o último do mês
                                                if (dia > diaF) {
                                                    //Caso sim: finaliza o preenchimento do calendário
                                                    j = 1;
                                                    //FIM DO PREENCHIMENTO DO CALENDÁRIO
                                                }
                                            %>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%} else {%>
                            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="row valign-wrapper">
                            <div class="center col s1">
                            </div>
                            <div class="center input-field col s8">
                                <input id="consultaN" name="consultaN" type="text"/>
                                <label for="consultaN"><i class="material-icons">search</i> Mostrar Exames </label>
                                <input id="consultaM" name="consultaM" type="hidden" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
                            <%}%>
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
            
        </script>
        
    </body>
</html>
