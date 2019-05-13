<%-- 
    Document   : cadastrarUsuario
    Created on : 29/10/2018, 08:31:58
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Atendente</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js">
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
            
            <div class="row">
                <div class="center input-field col s12">
                    <input id="consulta" name="consulta" type="text"/>
                    <label for="consulta"><i class="material-icons">search</i>Pesquisar usuário </label>
                </div>
            </div>
            
            <table id="tabelaUsuarios" name="tabelaUsuarios" class="centered striped">
                <thead>
                    <tr>
                        <th>Login</th>

                        <th>Cidade</th>
                        <th>Telefone</th>
                        <th>Telefone Celular</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                        ControleAtendente ca = new ControleAtendente();
                        List<Atendente> atendentes = ca.buscarTodosAtendentes();

                        for (Atendente atendente : atendentes) {
                        if(atendente.isVisivel()){
                    %>
                    <tr>
                        <td><%=atendente.getNomeCompleto() %></td>

                        <td><%=atendente.getCidadeAtuacao()%></td>
                        <td><%=atendente.getTelefone() %></td>
                        <td><%=atendente.getTelefoneCelular()%></td>
                        <td><a href="alterarUsuario.jsp?idusuario=<%=atendente.getIdUsuario() %>" class="waves-effect waves-light btn" value="Alterar">Alterar</a></td>
                        <td><a href="scripts/excluiratendente.jsp?idusuario=<%=atendente.getIdUsuario()%>" class="waves-effect waves-light btn" value="Excluir"> Excluir </a></td>
                    </tr>
                    <%
                        }
                    }
                    %>
                </tbody>
            </table>
            <div align="center">
                <label id="noResultMessage" name="noResultMessage">Nenhum instrutor encontrado</label>
            </div>
            
            <form action="scripts/cadastrarusuario.jsp" method="POST">
                <div class="row">
                    <div class="input-field col s4">
                        <p> Nome do Usuário: <input class="required" type="text" name="nome" maxlength="100"></p>
                    </div>
                    <div class="input-field col s4">
                        <p> Cidade de Atuação: <input class="required" type="text" name="cidade" maxlength="100"></p>
                    </div>
                    <div class="input-field col s4">
                        <p> Senha: <input class="required" type="password" name="senha" maxlength="100"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <p> Telefone: <input type="text" name="telefone" maxlength="13" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                    </div>
                    <div class="input-field col s6">
                        <p> Telefone Celular: <input type="text" name="telefonecelular" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                    </div>
                </div>

                <div class="center input-field col s12">
                    <button class="waves-effect waves-light btn" type="submit">SALVAR
                    </button>
                </div>

            </form>
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        
        <script>
                
            $('input#consulta').quicksearch('table#tabelaUsuarios tbody tr', {noResults: "#noResultMessage"});
            
            function fMasc(objeto, mascara) {
                obj = objeto;
                masc = mascara;
                setTimeout("fMascEx()", 1);
            }
            function fMascEx() {
                obj.value = masc(obj.value);
            }

            function mTel(tel) {
                tel = tel.replace(/\D/g, "");
                tel = tel.replace(/^(\d)/, "($1");
                tel = tel.replace(/(.{3})(\d)/, "$1)$2");
                if (tel.length === 9) {
                    tel = tel.replace(/(.{1})$/, "-$1");
                } else if (tel.length === 10) {
                    tel = tel.replace(/(.{2})$/, "-$1");
                } else if (tel.length === 11) {
                    tel = tel.replace(/(.{3})$/, "-$1");
                } else if (tel.length === 12) {
                    tel = tel.replace(/(.{4})$/, "-$1");
                } else if (tel.length > 12) {
                    tel = tel.replace(/(.{4})$/, "-$1");
                }
                return tel;
            }

        </script>

    </body>
</html>
