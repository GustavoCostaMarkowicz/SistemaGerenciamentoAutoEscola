<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
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
        <title>Relação Resultado Exame</title>
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
            
            <input type="hidden" name="idexame" value="<%=exame.getIdExame()%>"/>
            
            <div id="titulo">
                <h6 align="center"> Exame </h6>
            </div>

            <table class="centered striped">
                <tr>
                    <th>Data do Exame</th>
                    <th>Hora do Exame</th>
                    <th>Reteste</th>
                    <th>Aluno</th>

                    <th>Resultado</th>

                </tr>
                <%
                    
                    List<Aluno> alunos = exame.getAlunos();
                    boolean teste = exame.isReteste();
                    String steste;
                    
                    if(teste == true){
                        steste = "Sim";
                    } else {
                        steste = "Não";
                    }
                    
                    int flag = 0;
                    int i = 0;
                    
                    for(Aluno a: alunos){
                
                %>
                

                <tr>
                    <td><%=sdf.format(exame.getDataExame())%></td>
                    <td><%=sdf1.format(exame.getHorarioExame())%></td>
                    <td><%=steste%></td>
                    <td><%=a.getNomeCompleto()%></td>

                    <%
                        ControleResultadoExame cre = new ControleResultadoExame();
                    ResultadoExame re = cre.buscarResultadoExamesPorAlunoExame(exame.getAlunos().get(i).getIdPessoa(), exame.getIdExame());
                    String resultado;
                    if(re == null){
                        resultado = "";
                    } else{
                        resultado = re.getResultado();
                    }
                        if(resultado.equals("Indefinido")){
                            flag++;
                            %><td></td> <%
                        } else{
                        %><td><%=resultado%></td> <%
}
                    %>

                </tr>

                <%
                    i++;
                    }

                %>
            </table>
            
            <%
                if(flag > 0){
            %>
            <div class="row">
                <div class="center input-field col s12">
                    <a href="cadastrarResultadoExame.jsp?idexame=<%=exame.getIdExame()%>" class="waves-effect waves-light btn" type="submit">CADASTRAR</a>
                </div>
            </div>
            <%
                }
            %>
            
        </main>    
            
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

</html>
