<%-- 
    Document   : cadastrarExameMedico
    Created on : 06/10/2018, 16:34:41
    Author     : Usuario
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <%      
                String data1 = request.getParameter("dataExame");
               
                
            
    
    %>
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
            <form  action="scripts/examemedico.jsp" method="post" >
                <input type="hidden" name="dataexame" value="<%=data1%>"/>
               <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">

                        <div id="titulo" class="amber">
                            <h5 align="center">Cadastrar Exame Médico</h5>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Dados do Exame</h6>
                        </div>

                        <div class="center row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">aspect_ratio</i>
                                <input placeholder="" id="id" name="id" type="number" class="validate" maxlength="8" required>
                                <label for="id">Matrícula</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">looks_3</i>
                                <input placeholder="" id="horarioexame" class="validate" required type="text" name="horarioexame" maxlength="5" onkeydown="javascript: fMasc(this, mHorario);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="horarioexame">Horário do Exame</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="center row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">aspect_ratio</i>
                                <input placeholder="" id="medico" name="medico" type="text" class="validate" required>
                                <label for="medico">Médico Responsável</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">directions_car</i>
                                <input placeholder="" id="clinica" name="clinica" type="text" class="validate" maxlength="100" required>
                                <label for="clinica">Clínica</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>
                        
                        <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">invert_colors</i>
                                    <select id="reteste" name="reteste">
                                        
                                        <option value="Nao">Não</option>
                                        <option value="Sim">Sim</option>
                                       
                                    </select>
                                    <label>O Exame é um Reteste</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>

                                </div>
                            </div>
                        

                        <div class="center input-field col s12">
                            <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>



    </body>
    <script>

         $(document).ready(function () {
         $('select').formSelect();
         });

        function fMasc(objeto, mascara) {
            obj = objeto;
            masc = mascara;
            setTimeout("fMascEx()", 1);
        }
        function fMascEx() {
            obj.value = masc(obj.value);
        }

        

        function mHorario(horarioexame) {
            horarioexame = horarioexame.replace(/\D/g, "");
            horarioexame = horarioexame.replace(/(\d{2})(\d)/, "$1:$2");


            return horarioexame;
        }

    </script>

</html>
