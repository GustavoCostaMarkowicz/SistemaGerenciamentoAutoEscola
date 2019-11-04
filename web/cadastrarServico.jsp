<%-- 
    Document   : cadastrarServico
    Created on : 08/12/2018, 23:54:27
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Serviço</title>
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
            <form  action="scripts/cadastrarservico.jsp" method="POST" >
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-content">

                            <input type="hidden" id="valores" name="quantidade" value=""/>

                            <div id="titulo" class="amber">
                                <h5 align="center">Cadastrar Serviço</h5>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Serviço</h6>
                            </div>

                            <div class="center row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">receipt</i>
                                    <input placeholder="" id="nome" name="nome" type="text" class="validate" maxlength="60" required>
                                    <label for="nome">Nome do serviço</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>

                                <div class="input-field col s3">
                                    <i class="material-icons prefix">invert_colors</i>
                                    <select id="categoria" name="categoria">

                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="AB">AB</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="E">E</option>
                                        <option value="TodosA">Para Todas as Categorias, exceto A</option>
                                        <option value="Todos">Para Todas as Categorias</option>

                                    </select>
                                    <label>Categoria</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>

                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Pagamento</h6>
                            </div>

                            <div class="center row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">attach_money</i>
                                    <input placeholder="" id="valorVista" name="valorVista" type="text" class="validate" maxlength="100" required>
                                    <label for="marca">Valor à vista</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                                <div class="input-field col s5">
                                    <i class="material-icons prefix">local_parking</i>
                                    <input required placeholder="" id="parcelamento" name="parcelamento" type="number" maxlength="100">
                                    <label for="parcelamento">Número de opções de parcelamento</label>
                                </div>
                                <div class="input-field col s1">
                                    <a onclick="enviar();" value="" class="amber tooltipped btn-floating waves-effect waves-light" data-position="left" data-tooltip="preencher valores de pagamento"><i class="material-icons">send</i></a>
                                </div>
                            </div>

                            <div id="subs">
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

        <script>

                                        function enviar() {


                                            var i = document.getElementById("parcelamento").value;
                                            var texto = "";

                                            for (var j = 1; j <= i; j++) {

                                                if (j <= 9) {
                                                    texto += "<div class='center row'><div class='input-field col s6'><i class='material-icons prefix'>filter_" + j + "</i><input required placeholder='' id='parcela" + j + "' name='parcela" + j + "' type='number' maxlength='100'><label for='parcela" + j + "'>Parcelas</label></div><div class='input-field col s6'><i class='material-icons prefix'>attach_money</i><input required placeholder='' id='valor" + j + "' name='valor" + j + "' type='text' maxlength='100'><label for='valor" + j + "'>Valor da parcela</label></div></div>";
                                                } else {
                                                    texto += "<div class='center row'><div class='input-field col s6'><i class='material-icons prefix'>filter_9_plus</i><input required placeholder='' id='parcela" + j + "' name='parcela" + j + "' type='number' maxlength='100'><label for='parcela" + j + "'>Parcelas</label></div><div class='input-field col s6'><i class='material-icons prefix'>attach_money</i><input required placeholder='' id='valor" + j + "' name='valor" + j + "' type='text' maxlength='100'><label for='valor" + j + "'>Valor da parcela</label></div></div>";
                                                }

                                            }

                                            document.getElementById("subs").innerHTML = texto;
                                            document.getElementById("valores").value = i;

                                        }


                                        $(document).ready(function () {
                                            $('.tooltipped').tooltip();
                                        });

        </script>

    </body>
</html>
