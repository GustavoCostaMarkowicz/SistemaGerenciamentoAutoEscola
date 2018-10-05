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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js">
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

            if (teste == true) {
                sDoadorOrgaos = "Sim";
            } else {
                sDoadorOrgaos = "Não";
            }

        %>
        <form  action="scripts/alteraraluno.jsp" method="post" >
            <input type="hidden" name="idpessoa" value="<%=a.getIdPessoa()%>"/>
            <div id="titulo">
                <h6 align="center"> Dados Pessoais do Aluno </h6>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Nome Completo: <input type="text" name="nome" value="<%=a.getNomeCompleto()%>" size="60"></p>
                </div>
                <div class="input-field col s4">
                    <p> Data Nascimento: <input type="text" name="datanascimento" value="<%=sdf.format(a.getDataNascimento())%>" size="14"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Sexo: <input type="text" name="sexo" value="<%=a.getSexo()%>" size="14"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> RG: <input type="text" name="rg" value="<%=a.getRg()%>" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Órgão RG: <input type="text" name="orgaorg" value="<%=a.getOrgaoRg()%>" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> UF: <input type="text" name="uf" value="<%=a.getUf()%>" size="2"> </p>
                </div>
                <div class="input-field col s3">
                    <p> CPF: <input type="text" id="cpf" name="cpf" value="<%=a.getCpf()%>" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Nome do Pai: <input type="text" name="nomepai" value="<%=a.getNomePai()%>" size="50"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nome da Mãe: <input type="text" name="nomemae" value="<%=a.getNomeMae()%>" size="50"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados de Moradia </h6> 
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Cidade: <input type="text" name="cidade" value="<%=a.getCidade()%>" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Estado: <input type="text" name="estado" value="<%=a.getEstado()%>" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Cep: <input type="text" name="cep" value="<%=a.getCep()%>" size="15"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> Endereço: <input type="text" name="endereco" value="<%=a.getEndereco()%>" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Número: <input type="text" name="numero" value="<%=a.getNumero()%>" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Complemento: <input type="text" name="complemento" value="<%=a.getComplemento()%>" size="15"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Bairro: <input type="text" name="bairro" value="<%=a.getBairro()%>" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Informações Adicionais </h6>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Estado Civil: <input type="text" name="estadocivil" value="<%=a.getEstadoCivil()%>" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Grau Instrução: <input type="text" name="grauinstrucao" value="<%=a.getGrauInstrucao()%>" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <p> Naturalidade: <input type="text" name="naturalidade" value="<%=a.getNaturalidade()%>" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nacionalidade: <input type="text" name="nacionalidade" value="<%=a.getNacionalidade()%>" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <p> Doador Órgãos: <input type="text" name="doadororgaos" value="<%=sDoadorOrgaos%>" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Tipo Sanguíneo: <input type="text" name="tiposanguineo" value="<%=a.getTipoSanguineo()%>" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Contato </h6> 
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Telefone: <input type="text" name="telefone" value="<%=a.getTelefone()%>" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Telefone Celular: <input type="text" name="telefonecelular" value="<%=a.getTelefone()%>" size="15"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <p> Email: <input type="text" name="email" value="<%=a.getEmail()%>" size="15"> </p>
                </div>
            </div>

            <div class="center input-field col s12">
                <button class="waves-effect waves-light btn" type="submit">ALTERAR
                </button>
            </div>

        </form>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>




    </body>

    <script>
        $('.cpf').mask('000.000.000-00', {reverse: true});

        function fMasc(objeto, mascara) {
            obj = objeto;
            masc = mascara;
            setTimeout("fMascEx()", 1);
        }
        function fMascEx() {
            obj.value = masc(obj.value);
        }

        function mCPF(cpf) {
            cpf = cpf.replace(/\D/g, "");
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
            cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
            cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
            return cpf;
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


</html>
