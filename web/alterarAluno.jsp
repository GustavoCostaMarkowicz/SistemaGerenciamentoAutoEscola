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
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        .input-field .prefix.active {
            color: lightskyblue;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%

            int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idPessoa);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String complemento;
            if(a.getComplemento() == null){
                complemento = "";
            } else{
                complemento = a.getComplemento();
            }
            String grauInstrucao;
            if(a.getGrauInstrucao() == null){
                grauInstrucao = "";
            } else{
                grauInstrucao = a.getGrauInstrucao();
            }
            String naturalidade;
            if(a.getNaturalidade() == null){
                naturalidade = "";
            } else{
                naturalidade = a.getNaturalidade();
            }
            String nacionalidade;
            if(a.getNacionalidade()== null){
                nacionalidade = "";
            } else{
                nacionalidade = a.getNacionalidade();
            }
            String telefone;
            if(a.getTelefone() == null){
                telefone = "";
            } else{
                telefone = a.getTelefone();
            }
            String telefoneCelular;
            if(a.getTelefoneCelular()== null){
                telefoneCelular = "";
            } else{
                telefoneCelular = a.getTelefoneCelular();
            }
            String email;
            if(a.getEmail()== null){
                email = "";
            } else{
                email = a.getEmail();
            }
        %>
        <form  action="scripts/alteraraluno.jsp" method="POST" >
            <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">
                        <input type="hidden" name="idPessoa" value="<%=a.getIdPessoa()%>"/>
                        <input type="hidden" name="dataCadastro" value="<%=sdf.format(a.getDataCadastro())%>"/>

                        <div id="titulo" class="amber">
                            <h5 align="center">Alterar Dados do Aluno</h5>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Dados Pessoais</h6>
                        </div>

                        <div class="center row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">receipt</i>
                                <input value="<%=a.getProcesso()%>" placeholder="" id="numeroProcesso" name="numeroProcesso" type="text" class="validate" maxlength="100" required>
                                <label for="numeroProcesso">Nº do Processo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s8">
                                <i class="material-icons prefix">person</i>
                                <input value="<%=a.getNomeCompleto()%>" placeholder="" id="nome" name="nome" type="text" class="validate" maxlength="100" required>
                                <label for="nome">Nome completo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">today</i>
                                <input value="<%=sdf.format(a.getDataNascimento())%>" placeholder="" class="validate" required type="text" name="datanascimento" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="datanascimento">Data de nascimento</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">people_outline</i>
                                    <select id="sexo" name="sexo" class="validate" required>
                                        <%if (a.getSexo().equalsIgnoreCase("Masculino")) {%>
                                        <option value="Masculino" selected>Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                        <option value="Outro">Outro</option>
                                        <%} else if (a.getSexo().equalsIgnoreCase("Feminino")) {%>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino" selected>Feminino</option>
                                        <option value="Outro">Outro</option>
                                        <%} else {%>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                        <option value="Outro" selected>Outro</option>
                                        <%}%>
                                    </select>
                                    <label>Selecione o sexo do aluno</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input value="<%=a.getRg()%>" placeholder="" class="validate" required type="text" name="rg" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="rg">RG</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">account_balance</i>
                                <input value="<%=a.getOrgaoRg()%>" placeholder="" id="orgaorg" name="orgaorg" type="text" class="validate" maxlength="50" required>
                                <label for="orgaorg">Órgão emissor do RG</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">map</i>
                                <input value="<%=a.getUf()%>" placeholder="" id="uf" name="uf" type="text" class="validate" maxlength="2" required>
                                <label for="uf">UF</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input value="<%=a.getCpf()%>" placeholder="" class="validate" required type="text" name="cpf" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="cpf">CPF</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">person</i>
                                <input value="<%=a.getNomePai()%>" placeholder="" class="validate" required type="text" name="nomepai" maxlength="100">
                                <label for="nomepai">Nome do pai</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">person</i>
                                <input value="<%=a.getNomeMae()%>" placeholder="" class="validate" required type="text" name="nomemae" maxlength="100">
                                <label for="nomemae">Nome da mãe</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center"> Dados de Moradia </h6> 
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">location_city</i>
                                <input value="<%=a.getCidade()%>" placeholder="" class="validate" required type="text" name="cidade" maxlength="50">
                                <label for="cidade">Cidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">map</i>
                                <input value="<%=a.getEstado()%>" placeholder="" class="validate" required type="text" name="estado" maxlength="30">
                                <label for="estado">Estado</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">my_location</i>
                                <input value="<%=a.getCep()%>" placeholder="" class="validate" required type="text" name="cep" maxlength="9" onkeydown="javascript: fMasc(this, mCEP);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="cep">Cep</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s3">
                                <i class="material-icons prefix">place</i>
                                <input value="<%=a.getEndereco()%>" placeholder="" class="validate" required type="text" name="endereco" maxlength="120">
                                <label for="endereco">Endereço</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">looks_3</i>
                                <input value="<%=a.getNumero()%>" placeholder="" class="validate" required type="text" name="numero" maxlength="6" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="numero">Número</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">home</i>
                                <input value="<%=complemento%>" placeholder="" type="text" name="complemento" maxlength="20">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">domain</i>
                                <input value="<%=a.getBairro()%>" placeholder="" class="validate" required type="text" name="bairro" maxlength="50">
                                <label for="bairro">Bairro</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center"> Dados Adicionais </h6>
                        </div>

                        <div class="row">
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">people_outline</i>
                                    <select id="estadocivil" name="estadocivil">
                                        <%if(a.getEstadoCivil() == null){%>
                                        <option value="" disabled selected>Estados Civis</option>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                        <%} else if(a.getEstadoCivil().equalsIgnoreCase("Solteiro")){%>
                                        <option value="Solteiro" selected>Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                        <%} else if(a.getEstadoCivil().equalsIgnoreCase("Casado")){%>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado" selected>Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                        <%} else if(a.getEstadoCivil().equalsIgnoreCase("Viúvo")){%>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo" selected>Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                        <%} else if(a.getEstadoCivil().equalsIgnoreCase("Separado judicialmente")){%>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente" selected>Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                        <%} else if(a.getEstadoCivil().equalsIgnoreCase("Divorciado")){%>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado" selected>Divorciado</option>
                                        <%}%>                                   
                                    </select>
                                    <label>Selecione o estado civil do aluno</label>
                                </div>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">school</i>
                                <input value="<%=grauInstrucao%>" placeholder="" type="text" name="grauinstrucao" maxlength="30">
                                <label for="grauinstrucao">Grau de instrução</label>                             
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">child_care</i>
                                <input value="<%=a.getNaturalidade()%>" placeholder="" class="validate" required type="text" name="naturalidade" maxlength="50">
                                <label for="naturalidade">Naturalidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">public</i>
                                <input value="<%=a.getNacionalidade()%>" placeholder="" class="validate" required type="text" name="nacionalidade" maxlength="50">
                                <label for="nacionalidade">Nacionalidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">supervisor_account</i>
                                    <select id="doadororgaos" name="doadororgaos">
                                        <%if(a.isDoadorOrgaos()){%>
                                        <option value="Sim" selected>Sim</option>
                                        <option value="Não">Não</option>
                                        <%} else if(!a.isDoadorOrgaos()){%>
                                        <option value="Sim">Sim</option>
                                        <option value="Não" selected>Não</option>
                                        <%}%>
                                    </select>
                                    <label>Informe se o aluno é doador de órgãos</label>
                                </div>
                            </div>
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">invert_colors</i>
                                    <select id="tiposanguineo" name="tiposanguineo">
                                        <%if(a.getTipoSanguineo() == null){%>
                                        <option value="" disabled selected>Tipos Sanguíneos</option>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("A+")){%>
                                        <option value="A+" selected>A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("A-")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-" selected>A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("B+")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+" selected>B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("B-")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-" selected>B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("AB+")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+" selected>AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("AB-")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-" selected>AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("O+")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+" selected>O+</option>
                                        <option value="O-">O-</option>
                                        <%} else if(a.getTipoSanguineo().equalsIgnoreCase("O-")){%>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-" selected>O-</option>
                                        <%}%>
                                    </select>
                                    <label>Selecione o tipo sanguíneo do aluno</label>
                                </div>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Contato</h6>
                        </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">local_phone</i>
                                <input value="<%=telefone%>" placeholder="" type="text" name="telefone" maxlength="13" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="telefone">Telefone</label>                             
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">local_phone</i>
                                <input value="<%=telefoneCelular%>" placeholder="" type="text" name="telefonecelular" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="telefonecelular">Telefone celular</label>                             
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">alternate_email</i>
                                <input value="<%=email%>" placeholder="" class="validate" type="email" name="email" maxlength="120">
                                <label for="email">Email</label>
                                <span class="helper-text" data-error="E-mail inválido" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="center input-field col s12">
                            <button class="blue waves-effect waves-light btn col s6" type="submit">Salvar Alterações
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </body>

    <script>

                                    $(document).ready(function () {
                                        $('select').formSelect();
                                    });

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
