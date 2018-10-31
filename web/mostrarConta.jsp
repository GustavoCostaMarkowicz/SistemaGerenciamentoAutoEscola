<%@page import="java.util.Date"%>
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
        <link rel="shortcut icon" href="imagens/logo.png"/>
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
            overflow-x: hidden;

        }

        main {
            flex: 1 0 auto;
        }
        
        th {
            text-align: center;
        }
        
        .ultimo {
            border-right: solid 1px lightgray;
        }
        
        table {
            margin-top: -20px;
        }
        
        th#botao {
            font-weight: normal;
        }
        
        td.valido {
            color: green;
        }
        
        td.invalido {
            color: red;
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
                    <h6>Valor restante para pagamento: R$<%=c.getValorTotal()%></h6>
                </div>
                <div class="center input-field col s4">
                    <h6>Parcelas: <%=c.getParcelas()%></h6>
                </div>
            </div>

            <table class="centered">
                
                <tr>
                    <th>Usuário</th>
                    <th>Data</th>
                    <th>Hora</th>
                    <th class="ultimo">Registro</th>
                    <th id="botao"><a class="waves-effect waves-light btn" value="Pagamento">Realizar Pagamento</a></th>
                </tr>
                
                <%
                    
                    List<Registro> registros = cc.buscarRegistrosConta(a.getIdPessoa());
                    int ordem = registros.size() - 1;
                    
                    int diaParcela = registros.get(0).getDataRegistro().getDate();
                    int mesPrimeiraParcela = registros.get(0).getDataRegistro().getMonth() + 1;
                    if(mesPrimeiraParcela > 11){
                        mesPrimeiraParcela = 0;
                    }
                    String[] meses = new String[12];
                    meses[0] = "Janeiro";
                    meses[1] = "Fevereiro";
                    meses[2] = "Março";
                    meses[3] = "Abril";
                    meses[4] = "Maio";
                    meses[5] = "Junho";
                    meses[6] = "Julho";
                    meses[7] = "Agosto";
                    meses[8] = "Setembro";
                    meses[9] = "Outubro";
                    meses[10] = "Novembro";
                    meses[11] = "Dezembro";
                    
                    int i = ordem;
               
                    int anoParcela = registros.get(0).getDataRegistro().getYear() + 1900;
                    
                    int controleParcela = mesPrimeiraParcela;
                    String[] validade = new String[c.getParcelas()];
                    Date dataAtual = new Date();
                    for(int k = 0; k < c.getParcelas(); k++){
                        if(anoParcela > (dataAtual.getYear() + 1900)){
                            validade[k] = "valido";
                        } else if(anoParcela == (dataAtual.getYear() + 1900)){
                            if(controleParcela > dataAtual.getMonth()){
                                validade[k] = "valido";
                            } else if(controleParcela == dataAtual.getMonth()){
                                if(diaParcela >= dataAtual.getDate()){
                                    validade[k] = "valido";
                                } else{
                                    validade[k] = "invalido";
                                }
                            } else{
                                validade[k] = "invalido";
                            }
                        } else{
                            validade[k] = "invalido";
                        }
                        controleParcela++;
                        if(controleParcela > 11){
                            controleParcela = 0;
                            anoParcela++;
                        }
                    }
                    
                    anoParcela = registros.get(0).getDataRegistro().getYear() + 1900;
                    controleParcela = mesPrimeiraParcela;
                    
                    if(c.getParcelas() > registros.size()){
                        
                        for(int j = 0; j < c.getParcelas(); j++){
                
                        %>
                        
                            
                                <% 
                                    if(j < registros.size()){
                                %>
                                <tr>
                                <td><%=registros.get(i).getUsuario().getLogin()%></td>
                                <td><%=sdf.format(registros.get(i).getDataRegistro())%></td>
                                <td><%=sdf1.format(registros.get(i).getHorarioRegistro())%></td>
                                <td class="ultimo"><%=registros.get(i).getTextoRegistro()%></td>
                                <td class="<%=validade[j]%>"><%="Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] +  " de " + anoParcela + "<br>Valor - R$" + c.getValorTotal()/c.getParcelas()%></td>
                                </tr>
                                <%  } else { %>
                                <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="ultimo"></td>
                                <td class="<%=validade[j]%>"><%="Data de vencimento da parcela - " + diaParcela + " de " + meses[controleParcela] +  " de " + anoParcela + "<br>Valor - R$" + c.getValorTotal()/c.getParcelas()%></td>
                                </tr>
                                <%}
                                    controleParcela++;
                                    if(controleParcela > 11){
                                        controleParcela = 0;
                                        anoParcela++;
                                    }
                                    i--;
                                    }
                                %>
                            

                        <%
                            
                        
                        
                    } else{
                    
                    for(i = ordem; i >= 0; i--){
                
                    %>
                    
                        <tr>
                            <td><%=registros.get(i).getUsuario().getLogin()%></td>
                            <td><%=sdf.format(registros.get(i).getDataRegistro())%></td>
                            <td><%=sdf1.format(registros.get(i).getHorarioRegistro())%></td>
                            <td class="ultimo"><%=registros.get(i).getTextoRegistro()%></td>
                            <% for(int j = 0; j < c.getParcelas(); j++){ %>
                                <td>  </td>
                            <% } %>
                        </tr>

                    <%
                        
                    }
                    }

                %>
            </table>
            
        </main>
            
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

</html>
