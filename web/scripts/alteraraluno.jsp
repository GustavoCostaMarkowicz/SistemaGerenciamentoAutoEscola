<%-- 
    Document   : alteraraluno
    Created on : 02/10/2018, 15:15:54
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idPessoa = Integer.parseInt(request.getParameter("idpessoa"));
           
        
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            
            String nomeCompleto = request.getParameter("nome");
            String sData = request.getParameter("datanascimento");
            String sexo = request.getParameter("sexo");
            String rg = request.getParameter("rg");
            String orgaoRg = request.getParameter("orgaorg");
            String cpf = request.getParameter("cpf");
            String nomePai = request.getParameter("nomepai");
            String nomeMae = request.getParameter("nomemae");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String endereco = request.getParameter("endereco");
            String numero = request.getParameter("numero");
            String complemento  = request.getParameter("complemento");
            String cep = request.getParameter("cep");
            String bairro = request.getParameter("bairro");
            String telefone = request.getParameter("telefone");
            String telefoneCelular = request.getParameter("telefonecelular");
            String uf = request.getParameter("uf");
            String estadoCivil = request.getParameter("estadocivil");
            String naturalidade = request.getParameter("naturalidade");
            String nacionalidade = request.getParameter("nacionalidade");
            String grauInstrucao = request.getParameter("grauinstrucao");
            String sdoadorOrgaos = request.getParameter("doadororgaos");
            String tipoSanguineo = request.getParameter("tiposanguineo");
            String email = request.getParameter("email");
            
            Date dataCadastro = new Date();
            Date dataNascimento = sdf.parse(sData);
            boolean doadorOrgaos = false;
            if (sdoadorOrgaos.equals("sim")){
                doadorOrgaos = true;
            }
            
            Aluno a = new Aluno(orgaoRg, uf, estadoCivil, nomePai, nomeMae, dataNascimento, naturalidade, nacionalidade, sexo, grauInstrucao, doadorOrgaos, tipoSanguineo, email, idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);
            
            
            ControleAluno ca = new ControleAluno();
            
                ca.alterarAluno(a);
                response.sendRedirect("../aluno.jsp");
            
            

            
            %>
    </body>
</html>
