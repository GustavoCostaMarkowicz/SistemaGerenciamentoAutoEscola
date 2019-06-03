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
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        .input-field .prefix.active {
            color: green;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        
        <main>
        <form  action="scripts/cadastrarveiculo.jsp" method="POST" >
            <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">

                        <div id="titulo" class="amber">
                            <h5 align="center">Cadastrar Veículo</h5>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Dados do Veículo</h6>
                        </div>

                        <div class="center row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">aspect_ratio</i>
                                <input placeholder="" id="placa" name="placa" type="text" class="validate" maxlength="8" required>
                                <label for="placa">Placa</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">event</i>
                                <input placeholder="" id="anoFabricacao" name="anoFabricacao" type="text" class="validate" maxlength="4" required onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;">
                                <label for="anoFabricacao">Ano de fabricação</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="center row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">call_to_action</i>
                                <input placeholder="" id="marca" name="marca" type="text" class="validate" maxlength="100" required>
                                <label for="marca">Marca</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">directions_car</i>
                                <input placeholder="" id="modelo" name="modelo" type="text" class="validate" maxlength="100" required>
                                <label for="modelo">Modelo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="center input-field col s12">
                            <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </form>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</html>
