<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Instrutor</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
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
            color: green;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <form  action="scripts/cadastrarinstrutor.jsp" method="POST" >
            <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">

                        <div id="titulo" class="amber">
                            <h5 align="center">Cadastrar Instrutor</h5>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Dados Pessoais</h6>
                        </div>

                        <div class="center row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">person</i>
                                <input placeholder="" id="nome" name="nome" type="text" class="validate" maxlength="100" required>
                                <label for="nome">Nome completo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input placeholder="" type="text" name="rg" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="rg">RG</label>                               
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input placeholder="" type="text" name="cpf" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="cpf">CPF</label>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center"> Dados Profissionais </h6>
                        </div>

                        <div class="row">
                            <div class="input-field col s3">
                                    <i class="material-icons prefix">business_center</i>
                                    <select id="tipoInstrucao" name="tipoInstrucao">
    
                                        <option value="Exame De Vista">Instrutor Téorico</option>
                                        <option value="Exame De Vista">Instrutor Prático</option>

                                    </select>
                                    <label>Tipo de Instrução</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>

                            </div>
                            
                            <div class="input-field col s3">
                                <i class="material-icons prefix">beenhere</i>
                                <input placeholder="" id="situacao" name="situacao" type="text" class="validate" maxlength="60" required>
                                <label for="situacao">Situação</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">receipt</i>
                                <input placeholder="" id="numeroLicenca" name="numeroLicenca" type="text" maxlength="60">
                                <label for="numeroLicenca">Número da licença</label>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">event_available</i>
                                <input placeholder="" id="dataValidadeLicenca" name="tipoInstrucao" type="text" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="dataValidadeLicenca">Data de validade da licença</label>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center"> Dados de Moradia </h6> 
                        </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">location_city</i>
                                <input placeholder="" type="text" name="cidade" maxlength="50">
                                <label for="cidade">Cidade</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">map</i>
                                <input placeholder="" type="text" name="estado" maxlength="30">
                                <label for="estado">Estado</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">place</i>
                                <input placeholder="" type="text" name="endereco" maxlength="120">
                                <label for="endereco">Endereço</label>
                            </div>
                            <div class="input-field col s2">
                                <i class="material-icons prefix">looks_3</i>
                                <input placeholder="" type="text" name="numero" maxlength="6" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="numero">Número</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">domain</i>
                                <input placeholder="" type="text" name="bairro" maxlength="50">
                                <label for="bairro">Bairro</label>
                            </div>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Contato</h6>
                        </div>

                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">local_phone</i>
                                <input placeholder="" type="text" name="telefone" maxlength="13" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="telefone">Telefone</label>                             
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">local_phone</i>
                                <input placeholder="" type="text" name="telefonecelular" maxlength="14" onkeydown="javascript: fMasc(this, mTel);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="telefonecelular">Telefone celular</label>                             
                            </div>
                        </div>

                        <div class="center input-field col s12">
                            <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    <footer>
        <jsp:include page="rodape.jsp" flush="true" />
    </footer>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

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
