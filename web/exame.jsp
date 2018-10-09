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
        <title>Exame</title>
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
                <div class="center input-field col s3">
                    <a href="relacaoExameMedico.jsp"><button class="waves-effect waves-light btn" type="button">EXAME MÉDICO</button></a>
                </div>
                <div class="center input-field col s3">
                    <a href="relacaoExamePsicotecnico.jsp"><button class="waves-effect waves-light btn" type="button">EXAME PSICOTÉCNICO</button></a>
                </div>
                <div class="center input-field col s3">
                    <button class="waves-effect waves-light btn" type="button"><a href="relacaoExameTeorico.jsp">EXAME TEÓRICO</a></button>
                </div>
                <div class="center input-field col s3">
                    <button class="waves-effect waves-light btn" type="button"><a href="relacaoExamePratico.jsp">EXAME PRÁTICO</a></button>
                </div>
            </div>
        </main>
        
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        
    </body>
</html>