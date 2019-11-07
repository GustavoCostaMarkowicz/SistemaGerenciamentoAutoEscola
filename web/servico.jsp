<%-- 
    Document   : servicos
    Created on : 05/12/2018, 20:33:34
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Serviços</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>




    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%

                ControleServico cs = new ControleServico();

                List<Servico> servicos = new ArrayList();

                servicos = cs.buscarTodosServicos();

            %>
            <br>
            <br>
            <div class="row">
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-image">
                            <a href="scripts/gerarrelatorioresultadoexame.jsp" class="tooltipped btn-floating btn-large halfway-fab waves-effect waves-light green" data-position="left" data-tooltip="cadastrar um novo serviço"><i class="material-icons">add</i></a>
                        </div>
                        <div class="card-content">
                            <%                        for (Servico s : servicos) {
                                if(s.isVisivel()){
                                                        String categoria = s.getCategoria();
                                                        if(categoria.equals("T")){
                                                            categoria = "Todas";
                                                        } else if(categoria.equals("TA")){
                                                            categoria = "Todas, exceto A";
                                                        }
                            %>
                            <div class="row">
                                <div class="col s14 m12">
                                    <div class="card">
                                        <div class="card-content">
                                            <table >
                                                <thead>
                                                    <tr>
                                                        <th class="activator card-title"><%=s.getTipoServico()%> | Categoria(s) - <%=categoria%><i class="tooltipped material-icons right" data-position="left" data-tooltip="abrir informações de parcelas">more_vert</i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>| Valor à vista R$<%=s.getValorVista()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="card-reveal">                                            
                                            <table >
                                                <thead>
                                                    <tr>
                                                        <%
                                                            int i = 1;
                                                            for (RegraParcelas rp : s.getParcelas()) {
                                                        %>
                                                        <th>Opção <%=i%></th>
                                                            <%
                                                                i++;
                                                                }
                                                                while (i < 8) {
                                                            %>
                                                        <th>-----------</th>
                                                            <%
                                                                i++;
                                                                }
                                                            %>
                                                        <th></th>
                                                        <th></th>
                                                        <th class="card-title grey-text text-darken-4"><i class="material-icons right">close</i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <%i = 1;
                                                            for (RegraParcelas rp : s.getParcelas()) {%>
                                                        <td><%=rp.getParcela()%>X de R$<%=rp.getValorParcelado()%></td>
                                                        <%
                                                            i++;
                                                            }
                                                        while (i < 8) {
                                                        %>
                                                        <td>-----------</td>
                                                            <%
                                                                i++;
                                                                }
                                                            %>
                                                        <td><a href="alterarServico.jsp?serv=<%=s.getTipoServico()%>" value="Alterar" class="tooltipped activator btn-floating waves-effect waves-light blue" data-position="left" data-tooltip="Alterar dados do serviço"><i class="material-icons">find_replace</i></a></td>
                                                        <td><a href="scripts/excluirservico.jsp?serv=<%=s.getTipoServico()%>" value="Excluir" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="Excluir serviço"><i class="material-icons">delete_sweep</i></a></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>

    <script>
        $(document).ready(function () {
            $('.tooltipped').tooltip();
        });
    </script>

</html>
