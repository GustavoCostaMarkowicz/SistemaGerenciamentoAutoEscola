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
            if(p == 0 | p == 1){
            for (ExameMedico e : tems) {
                if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                    ems.add(e);
                }
            }
            }
            ControleExamePsicotecnico cept = new ControleExamePsicotecnico();
            List<ExamePsicotecnico> tepts = cept.buscarTodosExamePsicotecnicos();
            List<ExamePsicotecnico> epts = new ArrayList();
            if(p == 0 | p == 3){
            for (ExamePsicotecnico e : tepts) {
                if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                    epts.add(e);
                }
            }
            }
            ControleExamePratico cep = new ControleExamePratico();
            List<ExamePratico> teps = cep.buscarTodosExamePraticos();
            List<ExamePratico> eps = new ArrayList();
            if(p == 0 | p == 2){
            for (ExamePratico e : teps) {
                if (e.getDataExame().getDate() == Integer.parseInt(dia) & e.getDataExame().getMonth() == Imes & e.getDataExame().getYear() == new Date().getYear()) {
                    eps.add(e);
                }
            }
            }
            ControleExameTeorico cet = new ControleExameTeorico();
            List<ExameTeorico> tets = cet.buscarTodosExameTeoricos();
            List<ExameTeorico> ets = new ArrayList();
            if(p == 0 | p == 4){
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
                        if (!ems.isEmpty()) {
                    %>
                    <div id="titulo">
                        <h6 align="center">Exames Médicos</h6>
                    </div>
                    <%
                        int ano = ems.get(0).getDataExame().getYear() + 1900;

                    %>
                    <a href="scripts/gerarRelatorioExameMedico.jsp?data=<%=dia%>/<%=(Imes+1)%>/<%=ano%>" class="waves-effect waves-light btn-large" id="btnMed"><i class="material-icons left">content_paste</i>Gerar Relatório de Exames Médicos</a>
                    
                    <%
                        }
                    %>
                    <%
                        if (!epts.isEmpty()) {
                            %>
                    <div id="titulo">
                        <h6 align="center">Exames Psicotécnicos</h6>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Horário</th>
                                <th>Alunos</th>
                                <th>Reteste</th>
                                <th>Clínica</th>
                                <th>Psicólogo</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                            for (ExamePsicotecnico em : epts) {
                    %>
                    
                            <tr>
                                <td><%=em.getHorarioExame()%></td>
                                <td><%=em.getMaximoAlunos()%></td>
                                <td><%=em.isReteste()%></td>
                                <td><%=em.getClinica()%></td>
                                <td><%=em.getPsicologo()%></td>
                                <td><a href="" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do exame"><i class="material-icons">find_replace</i></button></td>
                                <td><a href="" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir exame"><i class="material-icons">delete_sweep</i></button></td>
                            </tr>                           
                        
                    <%
                            }
%>
             </tbody>
                    </table>       
                    <%
                        }
                    %>
                    <%
                        if (!ets.isEmpty()) {
                            %>
                    <div id="titulo">
                        <h6 align="center">Exames Teóricos</h6>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Horário</th>
                                <th>Alunos</th>
                                <th>Reteste</th>
                                <th>Serviço</th>
                                <th>Instrutor</th>
                                <th>Local de Aplicação</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                            for (ExameTeorico em : ets) {
                    %>
                    
                            <tr>
                                <td><%=em.getHorarioExame()%></td>
                                <td><%=em.getMaximoAlunos()%></td>
                                <td><%=em.isReteste()%></td>
                                <td><%=em.getServico()%></td>
                                <td><%=em.getInstrutor().getNomeCompleto()%></td>
                                <td><%=em.getLocalAplicacao()%></td>
                                <td><a href="" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do exame"><i class="material-icons">find_replace</i></button></td>
                                <td><a href="" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir exame"><i class="material-icons">delete_sweep</i></button></td>
                            </tr>                           
                        
                    <%
                            }
%>
                   </tbody>
                    </table> 
                    <%
                        }
                    %>
                    <%
                        if (!eps.isEmpty()) {
                            %>
                    <div id="titulo">
                        <h6 align="center">Exames Práticos</h6>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Horário</th>
                                <th>Alunos</th>
                                <th>Reteste</th>
                                <th>Categoria</th>
                                <th>Instrutor</th>
                                <th>Veículo</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                            for (ExamePratico em : eps) {
                    %>
                    
                            <tr>
                                <td><%=em.getHorarioExame()%></td>
                                <td><%=em.getMaximoAlunos()%></td>
                                <td><%=em.isReteste()%></td>
                                <td><%=em.getCategoria()%></td>
                                <td><%=em.getInstrutor().getNomeCompleto()%></td>
                                <td><%=em.getVeiculo().getPlaca()%></td>
                                <td><a href="" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="alterar dados do exame"><i class="material-icons">find_replace</i></button></td>
                                <td><a href="" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="excluir exame"><i class="material-icons">delete_sweep</i></button></td>
                            </tr>                           
                        
                    <%
                            }
%>
                  </tbody>
                    </table>  
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
    </script>
    
</html>
