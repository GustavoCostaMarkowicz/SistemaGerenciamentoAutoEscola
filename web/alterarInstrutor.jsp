<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Instrutor</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <%
            int idPessoa = Integer.parseInt((request.getParameter("idPessoa")));
            
            ControleInstrutor ci = new ControleInstrutor();
            Instrutor instrutor = ci.buscarInstrutorPorId(idPessoa);
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        %>
    </head>

    <style>

        div#titulo {

            background-color: lightgray;
            padding: 15px;
            font-weight: bold;

        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <form  action="scripts/alterarinstrutor.jsp" method="POST" >
            
            <input type="hidden" name="idPessoa" value="<%=instrutor.getIdPessoa()%>"/>
            
            <div id="titulo">
                <h6 align="center"> Dados Pessoais </h6>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <p> Nome Completo: <input type="text" name="nome" value="<%=instrutor.getNomeCompleto()%>" size="60"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> RG: <input type="text" name="rg" value="<%=instrutor.getRg()%>" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s6">
                    <p> CPF: <input type="text" id="cpf" name="cpf" value="<%=instrutor.getCpf()%>" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados Profissionais </h6>
            </div>
            
            <div class="row">
                <div class="input-field col s6">
                    <p> Tipo Instrução: <input type="text" name="tipoinstrucao" value="<%=instrutor.getTipoInstrucao()%>" size="60"></p>
                </div>
                <div class="input-field col s6">
                    <p> Situação: <input type="text" name="situacao" value="<%=instrutor.getSituacao()%>" size="60"></p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Número Licenca: <input type="text" name="numerolicenca" value="<%=instrutor.getNumeroLicencaInstrutor()%>" size="60"></p>
                </div>
                <div class="input-field col s6">
                    <p> Data Validade da Licenca: <input type="text" name="datavalidadelicenca" value="<%=sdf.format(instrutor.getDataValidadeLicenca())%>" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados de Moradia </h6> 
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Cidade: <input type="text" name="cidade" value="<%=instrutor.getCidade()%>" size="15"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Estado: <input type="text" name="estado" value="<%=instrutor.getEstado()%>" size="15"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Endereço: <input type="text" name="endereco" value="<%=instrutor.getEndereco()%>" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Número: <input type="text" name="numero" value="<%=instrutor.getNumero()%>" size="15"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Bairro: <input type="text" name="bairro" value="<%=instrutor.getBairro()%>" size="15"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Contato </h6> 
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <p> Telefone Celular: <input type="text" name="telefonecelular" value="<%=instrutor.getTelefoneCelular()%>" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div class="center input-field col s12">
                <button class="waves-effect waves-light btn" type="submit">SALVAR ALTERAÇÕES
                </button>
            </div>

        </form>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>

    <script>

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

        function mRG(rg) {
            rg = rg.replace(/\D/g, "");
            rg = rg.replace(/(\d{2})(\d)/, "$1.$2");
            rg = rg.replace(/(\d{3})(\d)/, "$1.$2");
            rg = rg.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
            return rg;
        }

        function mData(data) {
            data = data.replace(/\D/g, "");
            data = data.replace(/(\d{2})(\d)/, "$1/$2");
            data = data.replace(/(\d{2})(\d)/, "$1/$2");

            return data;
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
