<%-- 
    Document   : escolhaExame
    Created on : 06/10/2018, 16:04:31
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exames</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        a {
            color: white;
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
            <div class="row">
                <a href="relacaoExameMedico.jsp" class="amber waves-effect waves-light btn col s3" value="ExMed" style="color: black;">Exame Médico</a>
                <a href="relacaoExamePsicotecnico.jsp" class="amber waves-effect waves-light btn col s3" value="ExPsi" style="color: black;">Exame Psicotécnico</a>
                <a href="relacaoExameTeorico.jsp" class="amber waves-effect waves-light btn col s3" value="ExTeo" style="color: black;">Exame Teórico</a>
                <a href="relacaoExamePratico.jsp" class="amber waves-effect waves-light btn col s3" value="ExPra" style="color: black;">Exame Prático</a>
            </div>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
