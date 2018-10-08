<%@page import="br.edu.ifpr.irati.jsp.modelo.Veiculo"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Veículo</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            String placa = request.getParameter("placa");
            
            ControleVeiculo cv = new ControleVeiculo();
            Veiculo veiculo = cv.buscarVeiculosPorId(placa);
        %>
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
        <form  action="scripts/alterarveiculo.jsp" method="POST" >
            
            <input type="hidden" name="placa" value="<%=veiculo.getPlaca()%>"/>
            
            <div id="titulo">
                <h6 align="center"> Veículo </h6>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Ano de Fabricação: <input type="text" name="anofabricacao" value="<%=veiculo.getAnoFabricacao()%>" max-lenght="4" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"></p>
                </div>
                <div class="input-field col s4">
                    <p> Marca: <input type="text" name="marca" value="<%=veiculo.getMarca()%>"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Modelo: <input type="text" name="modelo" value="<%=veiculo.getModelo()%>"></p>
                </div>
            </div>

            <div class="center input-field col s12">
                <button class="waves-effect waves-light btn" type="submit">SALVAR ALTERAÇÕES
                </button>
            </div>

        </form>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

</html>
