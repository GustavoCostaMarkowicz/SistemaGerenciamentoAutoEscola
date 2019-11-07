<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : examesCalendario
    Created on : 02/10/2018, 21:40:04
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exames Por Data</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        div#titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        a#btnMed{

            border-radius: 100px;

        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
            String dia = request.getParameter("dia");
            int p = Integer.parseInt(request.getParameter("p"));
            int Imes = new Date().getMonth();

            ControleExameMedico cem = new ControleExameMedico();
            List<ExameMedico> tems = cem.buscarTodosExameMedicos();
            List<ExameMedico> ems = new ArrayList();
            if (p == 0 | p == 1) {
                for (ExameMedico e : tems) {
                    if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                        ems.add(e);
                    }
                }
            }
            ControleExamePsicotecnico cept = new ControleExamePsicotecnico();
            List<ExamePsicotecnico> tepts = cept.buscarTodosExamePsicotecnicos();
            List<ExamePsicotecnico> epts = new ArrayList();
            if (p == 0 | p == 3) {
                for (ExamePsicotecnico e : tepts) {
                    if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                        epts.add(e);
                    }
                }
            }
            ControleExamePratico cep = new ControleExamePratico();
            List<ExamePratico> teps = cep.buscarTodosExamePraticos();
            List<ExamePratico> eps = new ArrayList();
            if (p == 0 | p == 2) {
                for (ExamePratico e : teps) {
                    if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                        eps.add(e);
                    }
                }
            }
            ControleExameTeorico cet = new ControleExameTeorico();
            List<ExameTeorico> tets = cet.buscarTodosExameTeoricos();
            List<ExameTeorico> ets = new ArrayList();
            if (p == 0 | p == 4) {
                for (ExameTeorico e : tets) {
                    if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                        ets.add(e);
                    }
                }
            }

            String mes = "";
            if (Imes == 0) {
                mes = "janeiro";
            }
            if (Imes == 1) {
                mes = "fevereiro";
            }
            if (Imes == 2) {
                mes = "março";
            }
            if (Imes == 3) {
                mes = "abril";
            }
            if (Imes == 4) {
                mes = "maio";
            }
            if (Imes == 5) {
                mes = "junho";
            }
            if (Imes == 6) {
                mes = "julho";
            }
            if (Imes == 7) {
                mes = "agosto";
            }
            if (Imes == 8) {
                mes = "setembro";
            }
            if (Imes == 9) {
                mes = "outubro";
            }
            if (Imes == 10) {
                mes = "novembro";
            }
            if (Imes == 11) {
                mes = "dezembro";
            }

        %>
        <div class="col s14 m12">
            <div class="card" align="center">
                <div class="card-content">
                    <div id="titulo" class="amber">
                        <h5 align="center">Relatórios de Exame do dia <%=dia%> de <%=mes%></h5>
                    </div>
                    <%

                        if (ems.size() > 0) {
                            int ano = ems.get(0).getDataExame().getYear() + 1900;
                    %>

                    <div id="titulo">
                        <h6 align="center">Exames Médicos</h6>
                    </div>
                    <%

                    %>
                    <div style="margin-top: 10px;">
                        <a href="scripts/gerarRelatorioExameMedico.jsp?data=<%=dia%>/<%=(Imes + 1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Médicos</a>
                    </div>
                    <%
                        }
                    %>
                    <%
                        if (!epts.isEmpty()) {
                            int ano = epts.get(0).getDataExame().getYear() + 1900;
                    %>
                    <div id="titulo">
                        <h6 align="center">Exames Psicotécnicos</h6>
                    </div>

                    <div style="margin-top: 10px;">
                        <a href="scripts/gerarRelatorioExamePsicotecnico.jsp?data=<%=dia%>/<%=(Imes + 1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Médicos</a>
                    </div>

                    <%
                        }
                    %>
                    <%
                        if (!ets.isEmpty()) {
                            int ano = ets.get(0).getDataExame().getYear() + 1900;
                    %>
                    <div id="titulo">
                        <h6 align="center">Exames Teóricos</h6>
                    </div>

                    <div style="margin-top: 10px;">
                        <a href="scripts/gerarRelatorioExameTeorico.jsp?data=<%=dia%>/<%=(Imes + 1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Médicos</a>
                    </div>

                    <%
                        }
                    %>
                    <%
                        if (!eps.isEmpty()) {
                            int ano = eps.get(0).getDataExame().getYear() + 1900;
                    %>

                    <%
                        ControleInstrutor ci = new ControleInstrutor();
                        int dias = Integer.parseInt(dia);
                        List<Instrutor> is = ci.buscarInstrutorExameDia(dias, Imes + 1, ano);


                    %>

                    <h6>Gerar Relatório de Exames do Instrutor</h6>
                    <div class="row">
                        <div class="input-field col s12">
                            <select name="instrutor">
                                <option value="" disabled selected>Instrutor</option>
                                <%                                    for (Instrutor i : is) {
                                        if (i.isVisivel()) {
                                %>

                                <option value="a<%=i.getIdPessoa()%>"><%=i.getNomeCompleto()%></option>

                                <%
                                        }
                                    }
                                %>  
                            </select>
                            <label>Materialize Select</label>
                        </div>
                    </div>

                    <div></div>


                    <div style="margin-top: 10px;">
                        <a href="scripts/gerarRelatorioExamePraticoInstrutor.jsp?data=<%=dia%>/<%=(Imes + 1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Práticos</a>
                    </div>

                    <h5>OU</h5>

                    <h6>Gerar Relatório de Todos os Exames</h6>

                    <div style="margin-top: 10px;">
                        <a href="scripts/gerarRelatorioExamePraticoTodo.jsp?data=<%=dia%>/<%=(Imes + 1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Práticos</a>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.tooltipped').tooltip();
        });

        $(document).ready(function () {
            $('select').formSelect();
        });

    </script>

</html>
