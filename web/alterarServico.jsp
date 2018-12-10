<%-- 
    Document   : alterarServico
    Created on : 09/12/2018, 15:25:30
    Author     : Usuario
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Serviço</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    
    <style>

        div#titulo {

            background-color: lightgray;
            padding: 15px;
            font-weight: bold;

        }
        
    
        
        body {

            display: flex;
            min-height: 100vh;
            flex-direction: column;

        }

        main {
            flex: 1 0 auto;
        }



    </style>
    
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        
        <main>
        <form  action="scripts/alterarservico.jsp" method="POST" >
           <%
           
           String id = request.getParameter("idServico");
           
           ControleServico cs = new ControleServico();
           
           Servico servico = cs.buscarServicoPorNome(id);
           
           List<RegraParcelas> rps = servico.getParcelas();
           
           
           %>
            
            <input type="hidden" id="valores" name="quantidade" value=""/>
            <input type="hidden" name="idServico" value="<%=servico.getTipoServico() %>"/>

            <div id="titulo">
                <h6 align="center"> Alteração de Serviço </h6>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Número de Opções de Parcelamento: <input type="text" id="parcelamento" value="<%=rps.size() %>"></p>
                </div>
                <button style="margin-top: 50px;" class="waves-effect waves-light btn" type="button" onclick="enviar();">MOSTRAR
                </button>
            </div>

            <div class="row">
                
                <div class="input-field col s6">
                    <p> Nome do Serviço: <input type="text" name="nome" value="<%=servico.getTipoServico() %>"></p>
                </div>
                
                <div class="input-field col s6">
                    <p> Valor à Vista: <input type="text" name="valorVista" value="<%=servico.getValorVista() %>"></p>
                </div>
                
            </div>
            
        
                
                <div id="subs">
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
        
        <script>
            
            function enviar(){
                
                
                var i = document.getElementById("parcelamento").value;
                var texto = "";
                
                for(var j = 0; j < i; j++){
                    
                    texto += "<div class='row'><div class='input-field col s3'><p> Parcela "+j+": <input type='number' name='parcela"+j+"'></p></div><div class='input-field col s6'><p> Valor "+j+": <input type='text' name='valor"+j+"'></p></div></div>";
                    
                }
                
                document.getElementById("subs").innerHTML = texto;
                document.getElementById("valores").value = i;
                
            }
            
            
        </script>
        
    </body>
</html>
