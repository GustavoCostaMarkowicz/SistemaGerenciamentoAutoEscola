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

                for (Servico servico : servicos) {
                   
            %>
            <div class="row container" id="cartao">
                <div class="col s12 m6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title"><%=servico.getTipoServico()%></span>
                         <div class="row">
                <div class="center input-field col s6">
                    <a href="alterarServico.jsp?idServico=<%=servico.getTipoServico() %>"><button class="waves-effect waves-light btn" type="button">ALTERAR</button></a>
                </div>
                <div class="center input-field col s6">
                    <a href="excluirServico.jsp?idServico=<%=servico.getTipoServico() %>"><button class="waves-effect waves-light btn" type="button">EXCLUIR</button></a>
                </div>
            </div> 
                            <p> Valor a vista: <%=servico.getValorVista()%></p>
                            <p></p>
                            <%for (RegraParcelas regraParcela : servico.getParcelas()) {
                            %>    <p><%=regraParcela.getParcela()%> X de <%=regraParcela.getValorParcelado()%></p>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            
           <div class="row">
                <div class="center input-field col s6">
                    <a href="cadastrarServico.jsp"><button class="waves-effect waves-light btn" type="button">CADASTRAR</button></a>
                </div>
               <div class="center input-field col s6">
                    <a href="telaInicial.jsp"><button class="waves-effect waves-light btn" type="button">VOLTAR</button></a>
                </div>
            </div>
            
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
