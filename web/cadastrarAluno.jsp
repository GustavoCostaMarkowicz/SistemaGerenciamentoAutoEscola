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

    <body>
        <form  action="scripts/aluno.jsp" method="post" >

            <p> Nome Completo: <input type="text" name="nome" value="" size="60"></p>
            <p> Data Nascimento: <input type="date" name="datanascimento" value="" size="14"> </p>
            <p> Sexo: <input type="date" name="datanascimento" value="" size="14"></p>
            <p> RG: <input type="text" name="rg" value="" size="15"> </p>
            <p> Órgão RG: <input type="text" name="orgaorg" value="" size="15"> </p>
            <p> CPF: <input type="text" name="cpf" value="" size="15"> </p>
            <p> Nome do Pai: <input type="text" name="nomepai" value="" size="15"> </p>
            <p> Nome da Mãe: <input type="text" name="nomemae" value="" size="15"> </p>
            <p> Cidade: <input type="text" name="cidade" value="" size="15"> </p>
            <p> Estado: <input type="text" name="estado" value="" size="15"> </p>
            <p> Endereço: <input type="text" name="endereco" value="" size="15"> </p>
            <p> Número: <input type="text" name="numero" value="" size="15"> </p>
            <p> Complemento: <input type="text" name="complemento" value="" size="15"> </p>
            <p> Cep: <input type="text" name="cep" value="" size="15"> </p>
            <p> Bairro: <input type="text" name="bairro" value="" size="15"> </p>
            <p> Telefone: <input type="text" name="telefone" value="" size="15"> </p>
            <p> Telefone Celular: <input type="telefonecelular" name="tipo" value="" size="15"> </p>
            <p> UF: <input type="text" name="uf" value="" size="15"> </p>
            <p> Estado Civil: <input type="text" name="estadocivil" value="" size="15"> </p>
            <p> Naturalidade: <input type="text" name="naturalidade" value="" size="15"> </p>
            <p> Nacionalidade: <input type="text" name="nacionalidade" value="" size="15"> </p>
            <p> Grau Instrução: <input type="text" name="grauinstrucao" value="" size="15"> </p>
            <p> Doador Órgãos: <input type="text" name="doadororgaos" value="" size="15"> </p>
            <p> Tipo Sanguíneo: <input type="text" name="tiposanguineo" value="" size="15"> </p>
            <p> Email: <input type="text" name="email" value="" size="15"> </p>


            <input type="submit" value="Salvar" name="salvar"/>
        </form>
    </body>
</html>
