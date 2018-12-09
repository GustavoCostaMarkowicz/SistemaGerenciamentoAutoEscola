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



    </style>
    
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        
        <main>
        <form  action="scripts/cadastrarservico.jsp" method="POST" >
            
            <input type="hidden" id="valores" name="quantidade" value=""/>

            <div id="titulo">
                <h6 align="center"> Serviço </h6>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Número de Opções de Parcelamento: <input type="text" id="parcelamento"></p>
                </div>
                <button style="margin-top: 50px;" class="waves-effect waves-light btn" type="button" onclick="enviar();">MOSTRAR
                </button>
            </div>

            <div class="row">
                
                <div class="input-field col s6">
                    <p> Nome do Serviço: <input type="text" name="nome"></p>
                </div>
                
                <div class="input-field col s6">
                    <p> Valor à Vista: <input type="text" name="valorVista"></p>
                </div>
                
            </div>
            
        
                
                <div id="subs">
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
        
        <script>
            
            function enviar(){
                
                
                var i = document.getElementById("parcelamento").value;
                var texto = "";
                
                for(var j = 0; j < i; j++){
                    
                    texto += "<div class='row'><div class='input-field col s3'><p> Parcela "+j+": <input type='number' name='parcela"+j+"'></p></div><div class='input-field col s6'><p> Valor "+j+": <input type='text' name='valor"+j+"'></p></div></div>";
                    
                }
                
                document.getElementById("subs").innerHTML = texto;
                document.getElementById("valores").value = i;
                
            }
            
            
        </script>
        
    </body>
</html>
