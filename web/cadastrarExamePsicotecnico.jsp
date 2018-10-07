<%-- 
    Document   : cadastrarExameMedico
    Created on : 06/10/2018, 16:34:41
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js">
    </head>
    <style>

        body {

            display: flex;
            min-height: 100vh;
            flex-direction: column;

        }

        main {
            flex: 1 0 auto;
        }

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

        <main>
            <form  action="scripts/examepsicotecnico.jsp" method="post" >

                <div id="titulo">
                    <h6 align="center"> Exame Psicotécnico </h6>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <p> Matrícula do Aluno: <input type="number" name="id" value="" size="60"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s4">
                        <p> Data Exame: <input type="text" name="dataexame" value="" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                    return true;
                                else
                                    return false;"> </p>
                    </div>
                    <div class="input-field col s4">
                        <p> Horário do Exame: <input type="text" name="horarioexame"  maxlength="5" onkeydown="javascript: fMasc(this, mHorario);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                    return true;
                                else
                                    return false;"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <p> Psicólogo Responsável: <input type="text" name="medico" value="" size="14"> </p>
                    </div>
                    <div class="input-field col s6">
                        <p> Clínica: <input type="text" name="clinica" value="" size="14"></p>
                    </div>
                </div>
                
                <select name="reteste" class="browser-default">
                    <option disabled selected>O Exame é um Reteste?</option>
                    <option value="Sim">Sim</option>
                    <option value="Nao">Não</option> 
                </select>
                
                <div class="center input-field col s12">
                    <button class="waves-effect waves-light btn" type="submit">SALVAR
                    </button>
                </div>
            </form>
        </main>

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

        function mData(dataexame) {
            dataexame = dataexame.replace(/\D/g, "");
            dataexame = dataexame.replace(/(\d{2})(\d)/, "$1/$2");
            dataexame = dataexame.replace(/(\d{2})(\d)/, "$1/$2");

            return dataexame;
        }

        function mHorario(horarioexame) {
            horarioexame = horarioexame.replace(/\D/g, "");
            horarioexame = horarioexame.replace(/(\d{2})(\d)/, "$1:$2");


            return horarioexame;
        }

    </script>

</html>
