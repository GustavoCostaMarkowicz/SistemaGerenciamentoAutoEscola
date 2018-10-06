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

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <form  action="scripts/alterarveiculo.jsp" method="POST" >

            <div id="titulo">
                <h6 align="center"> Veículo </h6>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Placa: <input type="text" name="placa" value="<%=veiculo.getPlaca()%>" max-lenght="8" onkeydown="javascript: fMasc(this, mPlaca);"></p>
                </div>
                <div class="input-field col s6">
                    <p> Ano de Fabricação: <input type="text" name="anofabricacao" value="<%=veiculo.getAnoFabricacao()%>" max-lenght="4" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Marca: <input type="text" name="marca" value="<%=veiculo.getMarca()%>"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Modelo: <input type="text" name="modelo" value="<%=veiculo.getModelo()%>"></p>
                </div>
            </div>

            <div class="center input-field col s12">
                <button class="waves-effect waves-light btn" type="submit">SALVAR ALTERAÇÕES
                </button>
            </div>

        </form>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

    <script>

        function fMasc(objeto, mascara) {
            obj = objeto;
            masc = mascara;
            setTimeout("fMascEx()", 1);
        }
        function fMascEx() {
            obj.value = masc(obj.value);
        }

        function mPlaca(placa) {
            placa = placa.replace(/\D/g, "");
            placa = placa.replace(/(\d{3})(\d)/, "$1-$2");
            return placa;
        }

    </script>

</html>
