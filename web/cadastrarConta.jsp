<%-- 
    Document   : cadastrarConta
    Created on : 02/10/2018, 21:55:27
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
         <form  action="scripts/conta.jsp" method="post" >

            <p> Aluno: <input type="text" name="nome" value="" size="60"></p>
            <p> Valor de Entrada: <input type="text" name="orgaorg" value="" size="15"> </p>
            <p> Serviço: <input type="text" name="datanascimento" value="" size="14"> </p>
            <p> Valor Total: <input type="text" name="sexo" value="" size="14"></p>
            <p> Parcelas: <input type="text" name="rg" value="" size="15"> </p>

            <input type="submit" value="Salvar" name="salvar"/>
        </form>
    </body>
</html>
