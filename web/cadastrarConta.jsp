<%-- 
    Document   : cadastrarConta
    Created on : 02/10/2018, 21:55:27
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Conta</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        body {

            display: flex;
            min-height: 100vh;
            flex-direction: column;

        }

        main {
            flex: 1 0 auto;
        }

    </style>
            <%    session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if(u != null){
                logado = true;
            }
            
            int idAluno = Integer.parseInt(request.getParameter("idPessoa"));
            %>
    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
           
            
            
            <form  action="scripts/conta.jsp" method="POST">

                  <%
                if(u != null){
                    %> <input type="hidden" name="idusuario" value="<%=u.getIdUsuario()%>"/>
               <%
                }         
            %>
                
                <div class="row">
                    <div class="input-field col s6">
                        <p> Matrícula do aluno: <input type="number" name="id" value="<%=idAluno%>" size="60"></p>
                    </div>
                    <div class="input-field col s6">
                        <p> Valor de Entrada: <input type="text" name="valorentrada" size="15"> </p>
                    </div>
                </div>

                <label>Serviço: </label>
                <select name="tipo" class="browser-default">
                    <option disabled selected>Escolha o Serviço</option>
                    <%
                        ControleServico cs = new ControleServico();

                        for (Servico servicos : cs.buscarTodosServicos()) {
                    %>
                    <option value="<%=servicos.getTipoServico()%>"><%=servicos.getTipoServico()%></option>
                    <%
                        }
                    %>
                </select>

                <br>

                <div class="row">
                    <div class="input-field col s6">
                        <p> Valor Total: <input type="text" name="valortotal" size="14"></p>
                    </div>
                    <div class="input-field col s6">
                        <p> Parcelas: <input type="number" name="parcelas" size="15"> </p>
                    </div>
                </div>

                <div class="center input-field col s12">
                    <button class="waves-effect waves-light btn" type="submit">SALVAR
                    </button>
                </div>
            </form>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>

    </body>
</html>
