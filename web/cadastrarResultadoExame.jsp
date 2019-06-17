<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Resultado Exame</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            
            int idExame = Integer.parseInt(request.getParameter("idexame"));
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
            

            ControleExame ce = new ControleExame();
            Exame exame = ce.buscarExamesPorId(idExame);

        %>
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
        <form  action="scripts/cadastrarresultadoexame.jsp" method="POST" >
            
            <input type="hidden" name="idExame" value="<%=exame.getIdExame()%>"/>
            
            <div id="titulo">
                <h6 align="center"> Exame </h6>
            </div>

            <table class="centered striped">
                <%
                    
                    List<Aluno> alunos = exame.getAlunos();
                    boolean teste = exame.isReteste();
                    String steste;
                    
                    if(teste == true){
                        steste = "Sim";
                    } else {
                        steste = "Não";
                    }
                    
                    int i = 0;
                    for(Aluno a: alunos){
                
                %>
                <tr>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>
                    <th>Aluno</th>

                    <th>Resultado</th>

                </tr>

                <tr>
                    <td><%=sdf.format(exame.getDataExame())%></td>
                    <td><%=sdf1.format(exame.getHorarioExame())%></td>
                    <td><%=steste%></td>
                    <td><%=a.getNomeCompleto()%></td>

                    <td>
                        <div>
                     <div class="input-field col s6">
                         
                                    <select id="aprovacao" name="<%=i%>" class="validate" required>
                                        <option value="" disabled selected>Resultado:</option>
                                        <option value="Aprovado">Aprovado</option>
                                        <option value="Reprovado">Reprovado</option>
                                    </select>
                                    <label>Selecione o resultado do aluno</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                        </div>
                    </td>
                </tr>

                <%
                    i++;
                    }

                %>
            </table>
            
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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <script>
        
        
        
                $(document).ready(function () {
                  $('select').formSelect();
                });
        
        
    </script>

</html>
