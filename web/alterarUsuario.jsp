<%-- 
    Document   : alterarUsuario
    Created on : 05/12/2018, 16:21:49
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            int id = Integer.parseInt(request.getParameter("idusuario"));
            
        
            ControleAtendente ca = new ControleAtendente();
            Atendente atendente = ca.buscarAtendentePorId(id);
            
            

        %>
        
        <form action="scripts/alterarusuario.jsp" method="POST">
            <input type="hidden" name="idUsuario" value="<%=atendente.getIdUsuario() %>"/>
                <div class="row">
                    <div class="input-field col s4">
                        <p> Nome do Usuário: <input class="required" type="text" name="nome" maxlength="100" value="<%=atendente.getNomeCompleto() %>"></p>
                    </div>
                    <div class="input-field col s4">
                        <p> Cidade de Atuação: <input class="required" type="text" name="cidade" maxlength="100" value="<%=atendente.getCidadeAtuacao() %>"></p>
                    </div>
                    <div class="input-field col s4">
                        <p> Senha: <input class="required" type="password" name="senha" maxlength="100"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <p> Telefone: <input type="text" name="telefone" maxlength="13" value="<%=atendente.getTelefone() %>" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                    </div>
                    <div class="input-field col s6">
                        <p> Telefone Celular: <input type="text" name="telefonecelular" maxlength="14" value="<%=atendente.getTelefoneCelular() %>" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
    </body>
</html>
