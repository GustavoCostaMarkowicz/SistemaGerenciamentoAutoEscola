<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
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
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
            
            String ids = request.getParameter("idaluno");
            String side = request.getParameter("idexame");
            int ide = Integer.parseInt(side);
            int id = Integer.parseInt(ids);

            ControleAluno ca = new ControleAluno();
            Aluno al = ca.buscarAlunosPorId(id);
            ControleExame ce = new ControleExame();
            
            Exame e = ce.buscarExamesPorId(ide);

        %>
    </head>

    <style>

        div#titulo {

            background-color: #EEC900;
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
        
        table#tabelares {
            margin-top: 140px;
        }


    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        
    <main>
        
        <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">
        
        <form  action="scripts/cadastrarresultadoexame.jsp" method="POST" >
            <input type="hidden" name="idExame" value="<%=e.getIdExame() %>"/>
            <input type="hidden" name="idAluno" value="<%=ids %>"/>
            
            <table class="centered striped" id="tabelares">
                <%
                    
              
                    
                    
                    boolean sreteste = e.isReteste();
                    String reteste = "";
                    if(sreteste){
                        reteste = "Sim";
                    } else {
                        reteste = "Não";
                    }
                
                %>
                <tr>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>
                    <th>Aluno</th>

                    <th>Resultado</th>

                </tr>

                <tr>
                    <td><%=sdf.format(e.getDataExame())%></td>
                    <td><%=sdf1.format(e.getHorarioExame())%></td>
                    <td><%=reteste%></td>
                    <td><%=al.getNomeCompleto()%></td>

                    <td>
                        
                        <div>
                     <div class="input-field col s6">
                         
                                    <select id="aprovacao" name="resultado" class="validate" required>
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

            </table>
            
            
             <div class="center input-field col s12">
                <button class="amber waves-effect waves-light btn" type="submit">SALVAR
                </button>
            </div>

        </form>
        
                    </div>
                </div>
        </div>
                    
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
