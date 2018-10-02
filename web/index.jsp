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

    <style>

        body {
            background-color: #FF4500;
        }

        .card {
            margin-top: 200px;
            background-color: #F5F5DC;
            border-radius: 15px;
        }

    </style>

    <body>
        <header>

        </header>

        <main>
            <div class="row">
                <div class="col s4 offset-s4 card">
                    <div class="input-field col s12">
                        <input id="user_name" type="text" class="validate" required>
                        <label for="user_name">Login</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="password" type="password" class="validate" required>
                        <label for="password">Senha</label>
                    </div>
                    <div class="switch">
                        <label>
                            <input type="checkbox">
                            <span class="lever"></span> Mantenha-me conectado
                        </label>
                    </div>
                    <div class="input-field col s12">
                        <br>
                    </div>
                    <div class="input-field col s12">
                        <button href="telainicial.jsp" class="waves-effect waves-light btn" type="submit">Login
                        </button>
                        <button href="telainicial.jsp" class="waves-effect waves-light btn" type="button">Entrar
                        </button>
                    </div>
                </div>
            </div>

        </main>

        <footer>

        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

    </body>
</html>
