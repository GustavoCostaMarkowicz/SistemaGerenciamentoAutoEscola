<%-- 
    Document   : finalizarprocesso
    Created on : 13/05/2019, 10:16:53
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    int novo = Integer.parseInt(request.getParameter("id"));
    
    int id = Integer.parseInt(request.getParameter("idPessoa"));
    
    ControleAluno ca = new ControleAluno();
    Aluno a = ca.buscarAlunosPorId(id);
    
    if(novo == 1){
  
      a.setVisivel(false);
      
    } else {
        
        a.setVisivel(true);
        
    }

     ca.alterarAluno(a);
      
      response.sendRedirect("../aluno.jsp");

%>
