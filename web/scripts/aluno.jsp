<%-- 
    Document   : ministrante
    Created on : 03/07/2018, 09:04:44
    Author     : Usuario
--%>


<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nomeCompleto = request.getParameter("nome");
            String curriculoResumido = request.getParameter("curriculoResumido");
            String foto = request.getParameter("foto");

            //Aluno a = new Aluno(orgaoRg, uf, estadoCivil, nomePai, nomeMae, dataNascimento, naturalidade, nacionalidade, sexo, grauInstrucao, doadorOrgaos, tipoSanguineo, email, idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
            
            ControleAluno ca = new ControleAluno();
            
                //ca.inserirAluno(a);
                response.sendRedirect("../index.jsp");
            
            

            
        %>
    </body>
</html>
