<%-- 
    Document   : mostrarAluno
    Created on : 02/10/2018, 21:40:04
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
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        body {
            background-color: lightgrey;
        }

        .card {
            margin-top: 20px;
            background-color: gray;
            border-radius: 15px;
            align-items: center;
        }

    </style>

    <body>
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
        <div class="card">
            <div class="card-content" align="center">
                <span class="card-title activator grey-text text-darken-4"><p><%=a.getNomeCompleto() %></p><i class="material-icons right">more_vert</i></span>
                <p>Data de Nascimento: <%=sdf.format(a.getDataNascimento())%></p>
                <p>CPF: <%=a.getCpf() %></p>
                <p>RG: <%=a.getRg() %></p>
                <p>Órgão Emissor do RG: <%=a.getOrgaoRg()%></p>
                <p>Sexo: <%=a.getSexo()%></p>
                <p>Nome do Pai: <%=a.getNomePai()%></p>
                <p>Nome da Mãe: <%=a.getNomeMae()%></p>
                <p>Cidade: <%=a.getCidade()%></p>
                <p>Estado: <%=a.getEstado()%></p>
                <p>Endereço: <%=a.getEndereco()%></p>
                <p>Número: <%=a.getNumero()%></p>
                <p>Complemento: <%=a.getComplemento()%></p>
                <p>Cep: <%=a.getCep()%></p>
                <p>Bairro: <%=a.getBairro()%></p>
                <p>Telefone: <%=a.getTelefone()%></p>
                <p>Telefone-Celular: <%=a.getTelefoneCelular()%></p>
                <p>Unidade Federativa: <%=a.getUf()%></p>
                <p>Estado Civil: <%=a.getEstadoCivil()%></p>
                <p>Naturalidade: <%=a.getNaturalidade()%></p>
                <p>Nacionalidade: <%=a.getNacionalidade()%></p>
                <p>Grau de Instrução: <%=a.getGrauInstrucao()%></p>
                <p>Doador de Órgãos: <%=sDoadorOrgaos %></p>
                <p>Tipo Sanguíneo: <%=a.getTipoSanguineo()%></p>
                <p>Email: <%=a.getEmail()%></p>
            </div>
            <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                <p>Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
        </div>
    </body>
</html>