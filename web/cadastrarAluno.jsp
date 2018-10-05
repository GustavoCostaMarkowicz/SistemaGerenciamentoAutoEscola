<%-- 
    Document   : cadastrarAluno
    Created on : 01/10/2018, 09:09:02
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        div#titulo {

            background-color: lightgray;
            padding: 15px;

        }
        
        h6 {
            
            font-weight: bold;
            
        }


    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <form  action="scripts/aluno.jsp" method="post" >

            <div id="titulo">
                <h6 align="center"> Dados Pessoais do Aluno </h6>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Nome Completo: <input type="text" name="nome" value="" size="60"></p>
                </div>
                <div class="input-field col s4">
                    <p> Data Nascimento: <input type="text" name="datanascimento" value="" size="14"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Sexo: <input type="text" name="sexo" value="" size="14"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> RG: <input type="text" name="rg" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Órgão RG: <input type="text" name="orgaorg" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> UF: <input type="text" name="uf" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> CPF: <input type="text" name="cpf" value="" size="15"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Nome do Pai: <input type="text" name="nomepai" value="" size="50"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nome da Mãe: <input type="text" name="nomemae" value="" size="50"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados de Moradia </h6> 
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Cidade: <input type="text" name="cidade" value="" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Estado: <input type="text" name="estado" value="" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Cep: <input type="text" name="cep" value="" size="15"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> Endereço: <input type="text" name="endereco" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Número: <input type="text" name="numero" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Complemento: <input type="text" name="complemento" value="" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Bairro: <input type="text" name="bairro" value="" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Informações Adicionais </h6>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Estado Civil: <input type="text" name="estadocivil" value="" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Grau Instrução: <input type="text" name="grauinstrucao" value="" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <p> Naturalidade: <input type="text" name="naturalidade" value="" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nacionalidade: <input type="text" name="nacionalidade" value="" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <p> Doador Órgãos: <input type="text" name="doadororgaos" value="" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Tipo Sanguíneo: <input type="text" name="tiposanguineo" value="" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Contato </h6> 
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Telefone: <input type="text" name="telefone" value="" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Telefone Celular: <input type="text" name="telefonecelular" value="" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <p> Email: <input type="text" name="email" value="" size="15"> </p>
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
</html>
