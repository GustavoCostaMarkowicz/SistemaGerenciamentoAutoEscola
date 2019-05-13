<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veículo</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>
        
        label#noResultMessage {
            font-size: 30px;
        }
        
    </style>
    
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%
            
                session = request.getSession();
                Usuario u = (Usuario) session.getAttribute("usuario");

                ControleUsuario cu = new ControleUsuario();
                String tipoUsuario = cu.verificarTipoUsuario(u.getIdUsuario());
            
            %>
            
            <div class="row">
                <div class="center input-field col s12">
                    <input id="consulta" name="consulta" type="text"/>
                    <label for="consulta"><i class="material-icons">search</i>Pesquisar veículo </label>
                </div>
            </div>
            
            <table id="tabelaVeiculos" name="tabelaVeiculos" class="centered striped">
                <thead>
                    <tr>
                        <th>Placa </th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Ano de Fabricação</th>

                        <th></th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        ControleVeiculo controleVeiculo = new ControleVeiculo();
                        List<Veiculo> veiculos = new ArrayList();
                        veiculos = controleVeiculo.buscarTodosVeiculos();

                        for (Veiculo veiculo : veiculos) {
                            if(veiculo.isVisivel()){
                    %>
                    <tr>
                        <td><%=veiculo.getPlaca()%></td>
                        <td><%=veiculo.getMarca()%></td>
                        <td><%=veiculo.getModelo()%></td>
                        <td><%=veiculo.getAnoFabricacao()%></td>
                        <td><a href="alterarVeiculo.jsp?placa=<%=veiculo.getPlaca()%>" class="waves-effect waves-light btn" value="Alterar"> Alterar </a></td>
                        <%if(tipoUsuario.equals("diretor")) { %>
                        <td><a href="scripts/excluirveiculo.jsp?placa=<%=veiculo.getPlaca()%>" class="waves-effect waves-light btn" value="Excluir">Excluir</a></td>
                        <%
                        }
                        %>
                    </tr>

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <div align="center">
                <label id="noResultMessage" name="noResultMessage">Nenhum veículo encontrado</label>
            </div>
            <br>

            <div class="row">
                <div class="center input-field col s6">
                    <a href="cadastrarVeiculo.jsp" class="waves-effect waves-light btn" type="submit">CADASTRAR</a>
                </div>
                <div class="center input-field col s6">
                    <a href="telaInicial.jsp" class="waves-effect waves-light btn" type="submit">VOLTAR</a>
                </div>
            </div>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>

    </body>
    
    <script>   
        $('input#consulta').quicksearch('table#tabelaVeiculos tbody tr', {noResults: "#noResultMessage"});
    </script>
    
</html>