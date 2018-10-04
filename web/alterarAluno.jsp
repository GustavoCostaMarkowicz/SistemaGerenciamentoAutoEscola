<%-- 
    Document   : alteraraluno
    Created on : 02/10/2018, 15:15:54
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
        
            int idPessoa = Integer.parseInt(request.getParameter("idpessoa"));
            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idPessoa);
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            boolean teste = a.isDoadorOrgaos();
            String sDoadorOrgaos;
            
            if (teste == true){
                sDoadorOrgaos = "Sim";
            } else {
                sDoadorOrgaos = "Não";
            }
        
        %>
         <form  action="scripts/alteraraluno.jsp" method="post" >
            <input type="hidden" name="idpessoa" value="<%=a.getIdPessoa()%>"/>
            <p> Nome Completo: <input type="text" name="nome" value="<%=a.getNomeCompleto()%>" size="60"></p>
            <p> Data Nascimento: <input type="text" name="datanascimento" value="<%=sdf.format(a.getDataNascimento())%>" size="14"> </p>
            <p> Sexo: <input type="text" name="sexo" value="<%=a.getSexo()%>" size="14"></p>
            <p> RG: <input type="text" name="rg" value="<%=a.getRg()%>" size="15"> </p>
            <p> Órgão RG: <input type="text" name="orgaorg" value="<%=a.getOrgaoRg() %>" size="15"> </p>
            <p> CPF: <input type="text" name="cpf" value="<%=a.getCpf()%>" size="15"> </p>
            <p> Nome do Pai: <input type="text" name="nomepai" value="<%=a.getNomePai()%>" size="15"> </p>
            <p> Nome da Mãe: <input type="text" name="nomemae" value="<%=a.getNomeMae()%>" size="15"> </p>
            <p> Cidade: <input type="text" name="cidade" value="<%=a.getCidade()%>" size="15"> </p>
            <p> Estado: <input type="text" name="estado" value="<%=a.getEstado()%>" size="15"> </p>
            <p> Número: <input type="text" name="numero" value="<%=a.getNumero()%>" size="15"> </p>
            <p> Complemento: <input type="text" name="complemento" value="<%=a.getComplemento()%>" size="15"> </p>
            <p> Cep: <input type="text" name="cep" value="<%=a.getCep()%>" size="15"> </p>
            <p> Bairro: <input type="text" name="bairro" value="<%=a.getBairro()%>" size="15"> </p>
            <p> Telefone: <input type="text" name="telefone" value="<%=a.getTelefone()%>" size="15"> </p>
            <p> Telefone Celular: <input type="text" name="telefonecelular" value="<%=a.getTelefoneCelular()%>" size="15"> </p>
            <p> UF: <input type="text" name="uf" value="<%=a.getUf()%>" size="15"> </p>
            <p> Estado Civil: <input type="text" name="estadocivil" value="<%=a.getEstadoCivil()%>" size="15"> </p>
            <p> Naturalidade: <input type="text" name="naturalidade" value="<%=a.getNaturalidade()%>" size="15"> </p>
            <p> Nacionalidade: <input type="text" name="nacionalidade" value="<%=a.getNacionalidade()%>" size="15"> </p>
            <p> Grau Instrução: <input type="text" name="grauinstrucao" value="<%=a.getGrauInstrucao()%>" size="15"> </p>
            <p> Doador Órgãos: <input type="text" name="doadororgaos" value="<%=sDoadorOrgaos%>" size="15"> </p>
            <p> Tipo Sanguíneo: <input type="text" name="tiposanguineo" value="<%=a.getTipoSanguineo()%>" size="15"> </p>
            <p> Email: <input type="text" name="email" value="<%=a.getEmail()%>" size="15"> </p>


            <input type="submit" value="Salvar" name="salvar"/>
        </form>
             <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>
</html>
