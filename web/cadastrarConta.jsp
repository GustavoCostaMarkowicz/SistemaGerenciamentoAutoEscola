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
        <title>JSP Page</title>
    </head>
    <body>
         <form  action="scripts/conta.jsp" method="post" >

            <p> Nome Completo: <input type="text" name="nome" value="" size="60"></p>
            <p> Data Nascimento: <input type="text" name="datanascimento" value="" size="14"> </p>
            <p> Sexo: <input type="text" name="sexo" value="" size="14"></p>
            <p> RG: <input type="text" name="rg" value="" size="15"> </p>
            <p> Órgão RG: <input type="text" name="orgaorg" value="" size="15"> </p>


            <input type="submit" value="Salvar" name="salvar"/>
        </form>
    </body>
</html>
