<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autoescola Bell's</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
        %>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main>
            <%
                if(u != null){
                    %><p><%=u.getLogin()%></p>
                    <p> Autoescola </p><%
                } else{
                    %><p>Nenhum usuário logado</p><%
                }           
            %>
            
    <a href="relacaoExamePratico.jsp?data=16/06/2001" class="green waves-effect waves-light btn" type="submit">CADASTRAR CONTA</a>

            
        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
    </body>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
    
</html>