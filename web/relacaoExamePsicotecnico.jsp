<%-- 
    Document   : escolhaExame
    Created on : 06/10/2018, 16:04:31
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
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
            if(request.getParameter("p") != null){
                p = Integer.parseInt(request.getParameter("p"));
            } else{
                p = 1;
            }
            
            ControleExamePsicotecnico cem = new ControleExamePsicotecnico();
            List<ExamePsicotecnico> exames = cem.buscarTodosExamePsicotecnicos();
            int qtdE;
            String div = "";
            
            String dataExame = "";
            Date dataAtual = new Date();
            int mes = dataAtual.getMonth();
            int diaF = 0;
            String mesC = "";
            if (mes == 0) {
                diaF = 31;
                mesC = "Janeiro";
            }
            if (mes == 1) {
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
            color: black;
            font-size: 17px;
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

    </style>

    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <div class="row">
                <a href="relacaoExameMedico.jsp" class="grey lighten-5 waves-effect waves-light btn col s3" value="ExMed" style="color: gray;">Exame Médico</a>
                <a href="relacaoExamePsicotecnico.jsp" class="amber waves-effect waves-light btn col s3" value="ExPsi" style="color: black;">Exame Psicotécnico</a>
                <a href="relacaoExameTeorico.jsp" class="grey lighten-5 waves-effect waves-light btn col s3" value="ExTeo" style="color: gray;">Exame Teórico</a>
                <a href="relacaoExamePratico.jsp" class="grey lighten-5 waves-effect waves-light btn col s3" value="ExPra" style="color: gray;">Exame Prático</a>
            </div>
            <%if(p == 1){%>
            <div class="row">
                <a href="relacaoExamePsicotecnico.jsp?p=2" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Exibir Lista de Exames</a>
                <a href="relacaoExamePsicotecnico.jsp?p=1" class="red lighten-1 waves-effect waves-light btn col s6" value="">Exibir Calendário</a>
            </div>
            <%}else{%>
            <div class="row">
                <a href="relacaoExamePsicotecnico.jsp?p=2" class="red lighten-1 waves-effect waves-light btn col s6" value="">Exibir Lista de Exames</a>
                <a href="relacaoExamePsicotecnico.jsp?p=1" class="grey lighten-5 waves-effect waves-light btn col s6" value="" style="color: gray;">Exibir Calendário</a>
            </div>
            <%}%>
            
            
            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <%if(p == 2){%>
                        <div class="card-image">
                            <a href="cadastrarExamePsicotecnico.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo exame psicotécnico"><i class="material-icons">add</i></a>
                        </div>
                        <%}%>
                        <div class="card-content">
                            <%if(p == 1){%>
                            <div id="titulo" class="amber">
                                <h5 align="center"><%=mesC%> <%=new Date().getYear()+1900%></h5>
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
                                    int diaNAtual = dataAtual.getDate();
                                    int diaSAtual = dataAtual.getDay();
                                    int dia = 1;
                                    int diaSP;
                                    int i;
                                    int flag = 0;
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

                                    String[] diasS = new String[12];
                                    diasS[0] = "Domingo";
                                    diasS[1] = "Segunda";
                                    diasS[2] = "Terça";
                                    diasS[3] = "Quarta";
                                    diasS[4] = "Quinta";
                                    diasS[5] = "Sexta";
                                    diasS[6] = "Sábado";
                                %>
                                <tbody>
                                    <%
                                        int diaSControle = diaSP;
                                        for (int j = 0; j == 0;) {
                                    %>
                                    <tr>
                                        <%
                                            if (dia == 1) {
                                                for (int k = 0; k < diaSControle; k++) {
                                        %>
                                        <td></td> 
                                        <%
                                            }

                                            for (int k = diaSControle; k <= 6; k++) {
                                                qtdE = 0;
                                                for (ExamePsicotecnico e : exames) {
                                                    if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                        qtdE++;
                                                    }
                                                }
                                                if (qtdE == 1) {
                                                    div = String.valueOf(qtdE) + " exame<br>psicotécnico";
                                                } else {
                                                    div = String.valueOf(qtdE) + " exames<br>psicotécnicos";
                                                }
                                                if (qtdE > 0) {
                                        %>
                                        <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=3"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                                                    <%
                                                        dia++;
                                                    } else {

                                        dataExame = String.valueOf(dia)+"/"+String.valueOf(mes+1)+"/"+String.valueOf(new Date().getYear()+1900);

                                                    %>
                                        <td class="menu" ><a href="cadastrarExamePsicotecnico.jsp?dataExame=<%=dataExame%>"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                            <%
                                                        dia++;
                                                    }
                                                }
                                            } else {
                                                for (int k = diaSControle; k <= 6; k++) {
                                                    if (dia == diaF) {
                                                        qtdE = 0;
                                                        for (ExamePsicotecnico e : exames) {
                                                            if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                                qtdE++;
                                                            }
                                                        }
                                                        if (qtdE == 1) {
                                                            div = String.valueOf(qtdE) + " exame<br>psicotécnico";
                                                        } else {
                                                            div = String.valueOf(qtdE) + " exames<br>psicotécnicos";
                                                        }
                                                        if (qtdE > 0) {
                                            %><td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=3"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> <%
                                            } else {

                                        dataExame = String.valueOf(dia)+"/"+String.valueOf(mes+1)+"/"+String.valueOf(new Date().getYear()+1900);

                                                    %>
                                        <td class="menu" ><a href="cadastrarExamePsicotecnico.jsp?dataExame=<%=dataExame%>"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                            <%
                                                }
                                                if (k < 6) {
                                                    while (k < 6) {
                                            %><td></td><%
                                                        k++;
                                                    }
                                                }
                                                dia++;
                                            } else {
                                                qtdE = 0;
                                                for (ExamePsicotecnico e : exames) {
                                                    if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == new Date().getYear() & e.isVisivel()) {
                                                        qtdE++;
                                                    }
                                                }
                                                if (qtdE == 1) {
                                                    div = String.valueOf(qtdE) + " exame <br> psicotécnico";
                                                } else {
                                                    div = String.valueOf(qtdE) + " exames <br> psicotécnicos";
                                                }
                                                if (qtdE > 0) {
                                        %>
                                        <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=3"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                                                    <%
                                                        dia++;
                                                    } else {

                                        dataExame = String.valueOf(dia)+"/"+String.valueOf(mes+1)+"/"+String.valueOf(new Date().getYear()+1900);

                                                    %>
                                        <td class="menu" ><a href="cadastrarExamePsicotecnico.jsp?dataExame=<%=dataExame%>"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                            <%
                                                                dia++;

                                                            }
                                                        }
                                                    }
                                                }
                                                diaSControle = 0;
                                                if (dia > diaF) {
                                                    j = 1;
                                                }
                                            %>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%}else {%>
                            <div class="card">
                                <div class="row">
                                    <div class="center col s1">
                                    </div>
                                    <div class="center input-field col s10">
                                        <input id="consulta" name="consulta" type="text"/>
                                        <label for="consulta"><i class="material-icons">search</i>Pesquisar exame psicotécnico</label>
                                    </div>
                                    <div class="center col s1">
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <table id="tabelaExames" name="tabelaExames" class="centered striped">
                                    <thead>
                                        <tr>
                                            <th>Data</th>
                                            <th>Horário</th>
                                            <th>Quantidade de Alunos</th>
                                            <th>Resteste</th>
                                            <th>Clínica</th>
                                            <th>Psicólogo</th>
                                            <th></th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                        
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            ControleExamePsicotecnico controleExame = new ControleExamePsicotecnico();
                                        
                                            for (ExamePsicotecnico e : exames) {
                                                if (e.isVisivel()) {
                                        %>
                                        <tr>
                                            <td><%=sdf.format(e.getDataExame()) %></td>
                                            <td><%=e.getHorarioExame() %></td>
                                            <td><%=e.getMaximoAlunos()%></td>
                                            <td><%=e.isReteste()%></td>
                                            <td><%=e.getClinica()%></td>
                                            <td><%=e.getPsicologo()%></td>
                                            <td><a href="" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do exame"><i class="material-icons">find_replace</i></button></td>
                                <td><a href="" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir exame"><i class="material-icons">delete_sweep</i></button></td>
                                            
                                            <%
                                                }
                                            %>
                                        </tr>

                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <div align="center">
                                    <label id="noResultMessage" name="noResultMessage">Nenhum exame psicotécnico encontrado</label>
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
            $('input#consulta').quicksearch('table#tabelaExames tbody tr', {noResults: "#noResultMessage"});
            
            $(document).ready(function () {
            $('.tooltipped').tooltip();
        });
        </script>
        
    </body>
</html>
