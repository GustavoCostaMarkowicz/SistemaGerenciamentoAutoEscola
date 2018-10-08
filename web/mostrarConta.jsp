<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
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
        <title>Informações da Conta</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");
        int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
        ControleAluno ca = new ControleAluno();
        ControleConta cc = new ControleConta();
        Aluno a = ca.buscarAlunosPorId(idPessoa);
        Conta c = ca.buscarContaAluno(idPessoa);
    %>

    <style>

        div#titulo {

            background-color: lightgray;
            padding: 15px;
            font-weight: bold;
            

        }
        
        div#subtitulo {

            background-color: gray;
            font-weight: bold;
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
            
            <div id="titulo">
                <h6 align="center"> CONTA </h6>
            </div>
            
            <div id="subtitulo" class="row">
                <div class="center input-field col s4">
                    <h6><%=a.getNomeCompleto()%></h6>
                </div>
               <div class="center input-field col s4">
                    <h6>Valor Total: R$<%=c.getValorTotal()%></h6>
                </div>
                <div class="center input-field col s4">
                    <h6>Parcelas: <%=c.getParcelas()%></h6>
                </div>
            </div>

            <table class="centered">
                <%
                    
                    List<Registro> registros = cc.buscarRegistrosConta(a.getIdPessoa());
                    int ordem = registros.size() - 1;
                    
                    for(int i = ordem; i >= 0; i--){
                
                %>
                <tr>
                    <th>Usuário</th>
                    <th>Data</th>
                    <th>Hora</th>
                    <th>Registro</th>

                </tr>

                <tr>
                    <td><%=registros.get(i).getUsuario().getLogin()%></td>
                    <td><%=sdf.format(registros.get(i).getDataRegistro())%></td>
                    <td><%=sdf1.format(registros.get(i).getHorarioRegistro())%></td>
                    <td><%=registros.get(i).getTextoRegistro()%></td>

                </tr>

                <%
                    
                    }

                %>
            </table>
            
        </main>    
            
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

</html>
