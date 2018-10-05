<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String login = request.getParameter("login");
    
    String senha = request.getParameter("senha");
    
    session = request.getSession();
    
    if(login != null && senha != null){
        
        ControleUsuario controleUsuario = new ControleUsuario();
        
        try{
            Usuario usuario = controleUsuario.buscarUsuarioPorLoginESenha(login, senha);
            session.setAttribute("usuario", usuario);
            response.sendRedirect("../telainicial.jsp");
        } catch(Exception e){
            //alterar o valor na variável sessão
            session.setAttribute("usuario", null);
            //redirecionar o usuário
            response.sendRedirect("../index.jsp?e=" + e.getMessage());
        }
        
    } else{
        session.setAttribute("usuario", null);
        response.sendRedirect("../index.jsp?e=Acesso");
    }
%>
