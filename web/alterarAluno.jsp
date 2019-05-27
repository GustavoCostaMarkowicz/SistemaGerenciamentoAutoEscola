<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js">
    </head>
    
    <style>

        div#titulo {
            background-color: lightgray;
            padding: 15px;
            font-weight: bold;
        }
        
        label.obrigatorio {
            color: red;
            font-size: 20px;
        }
        
        label#descricaoObgt {
            color: red;
            font-size: 15px;
        }

    </style>
    
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%

            int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
            ControleAluno ca = new ControleAluno();
            Aluno aluno = ca.buscarAlunosPorId(idPessoa);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        %>
        <form  action="scripts/alteraraluno.jsp" method="POST" >

            <input type="hidden" name="idPessoa" value="<%=aluno.getIdPessoa()%>"/>

            <div id="titulo">
                <h6 align="center">Dados Pessoais</h6>
            </div>
            
            <label class="obrigatorio">*</label><label id="descricaoObgt"> Campo Obrigatório</label>
            
            <div class="row">
            <div class="input-field col s4">
                    <p> Nº do Processo: <label class="obrigatorio">*</label><input class="required" type="text" name="processo" value="<%=aluno.getProcesso() %>" maxlength="100"></p>
            </div>
           </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Nome Completo: <label class="obrigatorio">*</label><input class="required" type="text" name="nome" value="<%=aluno.getNomeCompleto()%>" maxlength="100"></p>
                </div>
                <div class="input-field col s4">
                    <p> Data de Nascimento: <label class="obrigatorio">*</label><input class="required" type="text" name="datanascimento" value="<%=sdf.format(aluno.getDataNascimento())%>" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s4">
                    <select name="sexo" class="required browser-default">
                        <option disabled selected>Sexo:</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Feminino">Feminino</option>
                        <option value="Outro">Outro</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> RG: <label class="obrigatorio">*</label><input class="required" type="text" name="rg" value="<%=aluno.getRg()%>" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Órgão Emissor do RG: <label class="obrigatorio">*</label><input class="required" type="text" name="orgaorg" value="<%=aluno.getOrgaoRg()%>" maxlength="50"> </p>
                </div>
                <div class="input-field col s3">
                    <p> UF: <label class="obrigatorio">*</label><input class="required" type="text" name="uf" value="<%=aluno.getUf()%>" maxlength="2"> </p>
                </div>
                <div class="input-field col s3">
                    <p> CPF: <label class="obrigatorio">*</label><input class="required" type="text" name="cpf" value="<%=aluno.getCpf()%>" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Nome do Pai: <label class="obrigatorio">*</label><input class="required" type="text" name="nomepai" value="<%=aluno.getNomePai()%>" maxlength="100"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nome da Mãe: <label class="obrigatorio">*</label><input class="required" type="text" name="nomemae" value="<%=aluno.getNomeMae()%>" maxlength="100"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados de Moradia </h6> 
            </div>

            <div class="row">
                <div class="input-field col s4">
                    <p> Cidade: <label class="obrigatorio">*</label><input class="required" type="text" name="cidade" value="<%=aluno.getCidade()%>" maxlength="50"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Estado: <label class="obrigatorio">*</label><input class="required" type="text" name="estado" value="<%=aluno.getEstado()%>" maxlength="30"> </p>
                </div>
                <div class="input-field col s4">
                    <p> Cep: <label class="obrigatorio">*</label><input class="required" type="text" name="cep" value="<%=aluno.getCep()%>" maxlength="9" onkeydown="javascript: fMasc(this, mCEP);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s3">
                    <p> Endereço: <label class="obrigatorio">*</label><input class="required" type="text" name="endereco" value="<%=aluno.getEndereco()%>" maxlength="120"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Número: <label class="obrigatorio">*</label><input class="required" type="text" name="numero" value="<%=aluno.getNumero()%>" maxlength="6" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Complemento: <label class="obrigatorio"></label><input class="required" type="text" name="complemento" value="<%=aluno.getComplemento()%>" maxlength="20"> </p>
                </div>
                <div class="input-field col s3">
                    <p> Bairro: <label class="obrigatorio">*</label><input class="required" type="text" name="bairro" value="<%=aluno.getBairro()%>" maxlength="50"> </p>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center"> Dados Adicionais </h6>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <select name="estadocivil" class="required browser-default">
                        <option disabled selected>Estado Civil:</option>
                        <option value="Solteiro">Solteiro</option>
                        <option value="Casado">Casado</option>
                        <option value="Viúvo">Viúvo</option>
                        <option value="Separado judicialmente">Separado judicialmente</option>
                        <option value="Divorciado">Divorciado</option>
                    </select>
                </div>
                <div class="input-field col s6">
                    <p> Grau Instrução: <input class="required" type="text" value="<%=aluno.getGrauInstrucao()%>" name="grauinstrucao" maxlength="30"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <p> Naturalidade: <label class="obrigatorio">*</label><input class="required" type="text" name="naturalidade" value="<%=aluno.getNaturalidade()%>" maxlength="50"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Nacionalidade: <label class="obrigatorio">*</label><input class="required" type="text" name="nacionalidade" value="<%=aluno.getNacionalidade()%>" maxlength="50"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s4">
                    <select name="doadororgaos" class="browser-default">
                        <option disabled selected>O aluno é doador de órgãos?</option>
                        <option value="Sim">Sim</option>
                        <option value="Não">Não</option>
                    </select>
                </div>
                <div class="input-field col s4">
                    <select name="tiposanguineo" class="browser-default">
                        <option disabled selected>Tipo Sanguíneo:</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>
            </div>

            <div id="titulo">
                <h6 align="center">Contato</h6>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <p> Telefone: <input type="text" name="telefone" value="<%=aluno.getTelefone()%>" maxlength="13" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
                <div class="input-field col s6">
                    <p> Telefone Celular: <input type="text" name="telefonecelular" value="<%=aluno.getTelefoneCelular()%>" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                return true;
                            else
                                return false;"> </p>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <p> Email: <input type="email" name="email" value="<%=aluno.getEmail()%>" maxlength="120"> </p>
                    <span class="helper-text" data-error="E-mail inválido" data-success="Ok!"></span>
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

        function mCEP(cep) {
            cep = cep.replace(/\D/g, "");
            cep = cep.replace(/(\d{5})(\d)/, "$1-$2");
            return cep;
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
