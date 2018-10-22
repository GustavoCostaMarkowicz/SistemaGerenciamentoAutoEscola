<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Instrutor</title>
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

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <form  action="scripts/cadastrarinstrutor.jsp" method="POST" >

            <div id="titulo">
                <h6 align="center"> Dados Pessoais </h6>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <p> Nome Completo: <input type="text" name="nome" value="" size="60"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> RG: <input type="text" name="rg" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s6">
                    <p> CPF: <input type="text" id="cpf" name="cpf" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados Profissionais </h6>
            </div>
            
            <div class="row">
                <div class="input-field col s6">
                    <p> Tipo Instrução: <input type="text" name="tipoinstrucao" value="" size="60"></p>
                </div>
                <div class="input-field col s6">
                    <p> Situação: <input type="text" name="situacao" value="" size="60"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Número Licenca: <input type="text" name="numerolicenca" value="" size="60"></p>
                </div>
                <div class="input-field col s6">
                    <p> Data Validade da Licenca: <input type="text" name="datavalidadelicenca" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados de Moradia </h6> 
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Cidade: <input type="text" name="cidade" value="" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Estado: <input type="text" name="estado" value="" size="15"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Endereço: <input type="text" name="endereco" value="" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Número: <input type="text" name="numero" value="" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Bairro: <input type="text" name="bairro" value="" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Contato </h6> 
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <p> Telefone Celular: <input type="text" name="telefonecelular" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div class="center input-field col s12">
                <button class="waves-effect waves-light btn" type="submit">SALVAR
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

        function mCPF(cpf) {
            cpf = cpf.replace(/\D/g, "");
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
            cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
            return cpf;
        }

        function mData(data) {
            data = data.replace(/\D/g, "");
            data = data.replace(/(\d{2})(\d)/, "$1/$2");
            data = data.replace(/(\d{2})(\d)/, "$1/$2");

            return data;
        }

        function mTel(tel) {
            tel = tel.replace(/\D/g, "");
            tel = tel.replace(/^(\d)/, "($1");
            tel = tel.replace(/(.{3})(\d)/, "$1)$2");
            if (tel.length === 9) {
                tel = tel.replace(/(.{1})$/, "-$1");
            } else if (tel.length === 10) {
                tel = tel.replace(/(.{2})$/, "-$1");
            } else if (tel.length === 11) {
                tel = tel.replace(/(.{3})$/, "-$1");
            } else if (tel.length === 12) {
                tel = tel.replace(/(.{4})$/, "-$1");
            } else if (tel.length > 12) {
                tel = tel.replace(/(.{4})$/, "-$1");
            }
            return tel;
        }

    </script>

</html>
