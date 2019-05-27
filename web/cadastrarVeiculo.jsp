<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Veículo</title>
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

        label.obrigatorio {
            color: red;
            font-size: 20px;
        }
        
        label#descricaoObgt {
            color: red;
            font-size: 15px;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        
        <main>
        <form  action="scripts/cadastrarveiculo.jsp" method="POST" >

            <div id="titulo">
                <h6 align="center"> Veículo </h6>
            </div>
            
            <label class="obrigatorio">*</label><label id="descricaoObgt"> Campo Obrigatório</label>

            <div class="row">
                <div class="input-field col s6">
                    <p> Placa: <label class="obrigatorio">*</label><input class="required" type="text" name="placa" maxlength="8"></p>
                </div>
                <div class="input-field col s6">
                    <p> Ano de Fabricação: <label class="obrigatorio">*</label><input class="required" type="text" name="anofabricacao" maxlength="4" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Marca: <label class="obrigatorio">*</label><input class="required" type="text" name="marca"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Modelo: <label class="obrigatorio">*</label><input class="required" type="text" name="modelo"></p>
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
