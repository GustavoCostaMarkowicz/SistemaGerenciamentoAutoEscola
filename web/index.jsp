<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.css" rel="stylesheet"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <%
            String e = request.getParameter("e");
            String mensagem = "";
            if (e != null) {
                mensagem = e;
                
            }
        %>
    </head>

    <style>

        body {
            background-color: gray;
        }

        .card {
            margin-top: 70px;
            background-color: white;
            border-radius: 15px;
        }
        
        div#mensagem {
            color: red;
        }
        
        div#logo {
            text-align: center;
            background-color: black;
        }

    </style>

    <body>
        <header>

        </header>

        <main>
            
            <div id="logo">
                <img src="imagens/logo.png">
            </div>

            <div class="row">
                <form action="scripts/login.jsp" method="POST">
                    <div class="col s4 offset-s4 card">
                        <div class="input-field col s12">
                            <input id="login" name="login" type="text" class="validate" required>
                            <label for="login">Usuário</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="senha" name="senha" type="password" class="validate" required>
                            <label for="senha">Senha</label>
                        </div>
                        <!--
                        <div class="switch">
                            <label>
                                <input type="checkbox">
                                <span class="lever"></span> Mantenha-me conectado
                            </label>
                        </div>
                        -->
                        <div id="mensagem">
                            <span class="lever"></span><%=mensagem.replace("Usuario", "Usuário")%>
                        </div>
                        <div class="input-field col s12">
                            <br>
                        </div>
                        <div class="center input-field col s12">
                            <button class="red waves-effect waves-light btn" type="submit">Login
                            </button>
                        </div>

                    </div>

            </div>
        </form>
    </div>

</main>

<footer>

</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

</body>
</html>
