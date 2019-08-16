<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
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

        table#calendario thead{
            background-color: black;
            color: white;
            font-size: 12px;
        }

        table#calendario td {
            border-right: solid 1px lightgrey; 
            border-left: solid 1px lightgrey;
            font-size: 16px;
        }

        div.dia {
            color: black;
        }

        td.menu:hover {
            background-color:rgb(179,255,179);
        }

        div#diaSelecionado {
            padding-left: 10px;
            padding-right: 10px;
        }

        p#diaSelecionadoP1 {
            font-size: 20px;
            color: lawngreen;
        }

        p#diaSelecionadoP2 {
            font-size: 25px;
            color: white;
        }

        div#calendario {
            margin: -24px;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <form  action="scripts/cadastraraluno.jsp" method="POST" >
            <div class="col s14 m12">
                <div class="card">
                    <div class="card-content">

                        <div id="titulo" class="amber">
                            <h5 align="center">Cadastrar Aluno</h5>
                        </div>

                        <div id="titulo">
                            <h6 align="center">Dados Pessoais</h6>
                        </div>

                        <div class="center row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">receipt</i>
                                <input placeholder="" id="numeroProcesso" name="numeroProcesso" type="text" class="validate" maxlength="100" required>
                                <label for="numeroProcesso">Nº do Processo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s8">
                                <i class="material-icons prefix">person</i>
                                <input placeholder="" id="nome" name="nome" type="text" class="validate" maxlength="100" required>
                                <label for="nome">Nome completo</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">today</i>
                                <input placeholder="" class="modal-trigger validate" href="#modal1" required type="text" id="datanascimento" name="datanascimento" maxlength="10" onkeydown="javascript: fMasc(this, mData);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
                                        <option value="" disabled selected>Sexos</option>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                        <option value="Outro">Outro</option>
                                    </select>
                                    <label>Selecione o sexo do aluno</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input placeholder="" class="validate" required type="text" name="rg" maxlength="12" onkeydown="javascript: fMasc(this, mRG);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
                                <input placeholder="" id="orgaorg" name="orgaorg" type="text" class="validate" maxlength="50" required>
                                <label for="orgaorg">Órgão emissor do RG</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">map</i>
                                <input placeholder="" id="uf" name="uf" type="text" class="validate" maxlength="2" required>
                                <label for="uf">UF</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">image_aspect_ratio</i>
                                <input placeholder="" class="validate" required type="text" name="cpf" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
                                <input placeholder="" class="validate" required type="text" name="nomepai" maxlength="100">
                                <label for="nomepai">Nome do pai</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">person</i>
                                <input placeholder="" class="validate" required type="text" name="nomemae" maxlength="100">
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
                                <input placeholder="" class="validate" required type="text" name="cidade" maxlength="50">
                                <label for="cidade">Cidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">map</i>
                                <input placeholder="" class="validate" required type="text" name="estado" maxlength="30">
                                <label for="estado">Estado</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">my_location</i>
                                <input placeholder="" class="validate" required type="text" name="cep" maxlength="9" onkeydown="javascript: fMasc(this, mCEP);" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
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
                                <input placeholder="" class="validate" required type="text" name="endereco" maxlength="120">
                                <label for="endereco">Endereço</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">looks_3</i>
                                <input placeholder="" class="validate" required type="text" name="numero" maxlength="6" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                            return true;
                                        else
                                            return false;">
                                <label for="numero">Número</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">home</i>
                                <input placeholder="" type="text" name="complemento" maxlength="20">
                                <label for="complemento">Complemento</label>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix">domain</i>
                                <input placeholder="" class="validate" required type="text" name="bairro" maxlength="50">
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
                                        <option value="" disabled selected>Estados Civis</option>
                                        <option value="Solteiro">Solteiro</option>
                                        <option value="Casado">Casado</option>
                                        <option value="Viúvo">Viúvo</option>
                                        <option value="Separado judicialmente">Separado judicialmente</option>
                                        <option value="Divorciado">Divorciado</option>
                                    </select>
                                    <label>Selecione o estado civil do aluno</label>
                                </div>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">school</i>
                                <input placeholder="" type="text" name="grauinstrucao" maxlength="30">
                                <label for="grauinstrucao">Grau de instrução</label>                             
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">child_care</i>
                                <input placeholder="" class="validate" required type="text" name="naturalidade" maxlength="50">
                                <label for="naturalidade">Naturalidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">public</i>
                                <input placeholder="" class="validate" required type="text" name="nacionalidade" maxlength="50">
                                <label for="nacionalidade">Nacionalidade</label>
                                <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                            </div>
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">supervisor_account</i>
                                    <select id="doadororgaos" name="doadororgaos">
                                        <option value="" disabled selected>Opções</option>
                                        <option value="Sim">Sim</option>
                                        <option value="Não">Não</option>
                                    </select>
                                    <label>Informe se o aluno é doador de órgãos</label>
                                </div>
                            </div>
                            <div>
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">invert_colors</i>
                                    <select id="tiposanguineo" name="tiposanguineo">
                                        <option value="" disabled selected>Tipos Sanguíneos</option>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
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
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">alternate_email</i>
                                <input placeholder="" class="validate" type="email" name="email" maxlength="120">
                                <label for="email">Email</label>
                                <span class="helper-text" data-error="E-mail inválido" data-success="Ok!"></span>
                            </div>
                        </div>

                        <div class="center input-field col s12">
                            <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                            </button>
                        </div>

                        <!--________MODAL________-->
                        <%
                            Date dataAtual = new Date();
                            int mes = dataAtual.getMonth();
                            //diaF = último dia do mês
                            int diaF = 0;
                            //mesC = mês atual em String
                            String mesC = "";
                            //Testes para determinar a variável 'diaF'
                            if (mes == 0) {
                                diaF = 31;
                                mesC = "Janeiro";
                            }
                            if (mes == 1) {
                                //Teste de ano bissexto
                                if ((dataAtual.getYear() + 1900) % 4 == 0 & ((dataAtual.getYear() + 1900) % 100 != 0 | (dataAtual.getYear() + 1900) % 400 == 0)) {
                                    diaF = 29;
                                } else {
                                    diaF = 28;
                                }
                                mesC = "Fevereiro";
                            }
                            if (mes == 2) {
                                diaF = 31;
                                mesC = "Março";
                            }
                            if (mes == 3) {
                                diaF = 30;
                                mesC = "Abril";
                            }
                            if (mes == 4) {
                                diaF = 31;
                                mesC = "Maio";
                            }
                            if (mes == 5) {
                                diaF = 30;
                                mesC = "Junho";
                            }
                            if (mes == 6) {
                                diaF = 31;
                                mesC = "Julho";
                            }
                            if (mes == 7) {
                                diaF = 31;
                                mesC = "Agosto";
                            }
                            if (mes == 8) {
                                diaF = 30;
                                mesC = "Setembro";
                            }
                            if (mes == 9) {
                                diaF = 31;
                                mesC = "Outubro";
                            }
                            if (mes == 10) {
                                diaF = 30;
                                mesC = "Novembro";
                            }
                            if (mes == 11) {
                                diaF = 31;
                                mesC = "Dezembro";
                            }
                            
                            String diaAtual;
                            String mesAtual;
                            if(dataAtual.getDate() < 10){
                                diaAtual = "0"+String.valueOf(dataAtual.getDate());
                            } else{
                                diaAtual = String.valueOf(dataAtual.getDate());
                            }
                            if(mes < 10){
                                mesAtual = "0"+String.valueOf(mes+1);
                            } else{
                                mesAtual = String.valueOf(mes+1);
                            }
                        %>

                        <div id="modal1" class="modal">
                            <div class="modal-content">
                                <div class="card horizontal">
                                    <div id="diaSelecionado" class="card-image blue-grey darken-3">
                                        <p align="center" style="color:transparent;">_</p>
                                        <input type="hidden" id="diaSelecionadoInput" value="26/08/2019">
                                        <p id="diaSelecionadoP1" align="left"><%=diaAtual%>/<%=mesAtual%>/<%=dataAtual.getYear() + 1900%></p>
                                        <p id="diaSelecionadoP2" align="left"><%=diaAtual%> de <%=mesC%> de <%=dataAtual.getYear() + 1900%></p> 
                                    </div>
                                    <div class="card-stacked">
                                        <div id="calendario" class="card-content">     
                                            <div id="titulo" class="amber">
                                                <h6 align="center"><%=mesC%> <%=new Date().getYear() + 1900%></h6>
                                            </div>
                                            <table id="calendario" name="calendario" class="highlight centered">
                                                <thead>
                                                    <tr>
                                                        <th>D</th>
                                                        <th>S</th>
                                                        <th>T</th>
                                                        <th>Q</th>
                                                        <th>Q</th>
                                                        <th>S</th>
                                                        <th>S</th>
                                                    </tr>
                                                </thead>
                                                <%
                                                    //diaNAtual = dia atual do mês
                                                    int diaNAtual = dataAtual.getDate();
                                                    //diaSAtual = dia atual da semana
                                                    int diaSAtual = dataAtual.getDay();
                                                    //dia = contador de dias
                                                    int dia = 1;
                                                    //diaSP = dia da semana do primeiro dia do mês
                                                    int diaSP;
                                                    int i;
                                                    int flag = 0;
                                                    //Testes para definir a variável 'diaSP'
                                                    if (diaNAtual != 1) {
                                                        for (i = diaNAtual; i > 1; i -= 7) {
                                                        }
                                                        if (i != 1) {
                                                            for (i = i; i < 1; i++) {
                                                                flag++;
                                                            }
                                                            diaSP = (diaSAtual + flag) % 7;
                                                        } else {
                                                            diaSP = diaSAtual;
                                                        }
                                                    } else {
                                                        diaSP = diaSAtual;
                                                    }

                                                %>
                                                <tbody>
                                                    <%                                        //diaSControle = controla o valor do dia da semana
                                                        int diaSControle = diaSP;
                                                        //Inicia o preenchimento do calendário com a condição de parada de 'j' ser != 0
                                                        for (int j = 0; j == 0;) {
                                                    %>
                                                    <tr>
                                                        <%
                                                            //Preenche a primeira linha do calendário
                                                            if (dia == 1) {
                                                                //Preenche os espaços vazios correspondentes aos dias do mês anterior
                                                                for (int k = 0; k < diaSControle; k++) {
                                                        %>
                                                        <td></td> 
                                                        <%
                                                            }
                                                            //Preenche a primeira linha a partir do primeiro dia do mês até sábado
                                                            for (int k = diaSControle; k <= 6; k++) {
                                                        %>
                                                        <td id="<%=dia%>" class="menu"><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=new Date().getYear() + 1900%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                                                <%
                                                                        dia++;
                                                                    }
                                                                    //Preenche as demais linhas do calendário
                                                                } else {
                                                                    //Inicia o preenchimento da linha de domingo à sábado
                                                                    for (int k = diaSControle; k <= 6; k++) {
                                                                        //Verifica se o dia do mês em execução é o último do mês
                                                                        if (dia == diaF) {
                                                                %>
                                                        <td id="<%=dia%>" class="menu" ><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=new Date().getYear() + 1900%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                                                <%
                                                                    //Testa se o último dia do mês é sábado
                                                                    if (k < 6) {
                                                                        //Caso não: preenche os dias da semana com campos vazios até sábado
                                                                        while (k < 6) {
                                                                %><td></td><%
                                                                            k++;
                                                                        }
                                                                    }
                                                                    dia++;
                                                                } else {
                                                        %>
                                                        <td id="<%=dia%>" class="menu" ><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=new Date().getYear() + 1900%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
                                                                <%
                                                                                dia++;

                                                                            }
                                                                        }
                                                                    }
                                                                    //Define diaScontrole como domingo
                                                                    diaSControle = 0;
                                                                    //Verifica se o dia do mês em execução é o último do mês
                                                                    if (dia > diaF) {
                                                                        //Caso sim: finaliza o preenchimento do calendário
                                                                        j = 1;
                                                                        //FIM DO PREENCHIMENTO DO CALENDÁRIO
                                                                    }
                                                                %>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-close waves-effect waves-green btn-flat" style="color: red;">Cancelar</a>
                                <a href="#!" onclick="preencherDataCalendario()" class="modal-close waves-effect waves-green btn-flat" style="color: green;">Ok</a>
                            </div>
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

                                    $(document).ready(function () {
                                        $('select').formSelect();
                                    });

                                    $(document).ready(function () {
                                        $('.modal').modal();
                                    });

                                    $(document).ready(function () {
                                        $('.tooltipped').tooltip();
                                    });

                                    function diaFocado(diaSelecionado, mes, mesC, ano) {
                                        var data;
                                        var dataTexto;
                                        if (diaSelecionado < 10) {
                                            data = "0" + diaSelecionado;
                                            dataTexto = "0" + diaSelecionado;
                                        } else {
                                            data = diaSelecionado;
                                            dataTexto = diaSelecionado;
                                        }
                                        if (mes < 10) {
                                            mes = "0" + mes;
                                        }
                                        data += "/" + mes + "/" + ano;
                                        dataTexto += " de " + mesC + " de " + ano;
                                        document.getElementById("diaSelecionadoP1").innerHTML = data;
                                        document.getElementById("diaSelecionadoInput").value = data;
                                        document.getElementById("diaSelecionadoP2").innerHTML = dataTexto;
                                        document.getElementById(diaSelecionado).style.backgroundColor = "lawngreen";
                                        var i;
                                        for (i = 1; i <= 31; i++) {
                                            if (i !== diaSelecionado) {
                                                document.getElementById(i).style.backgroundColor = "transparent";
                                            }
                                        }
                                    }

                                    function preencherDataCalendario() {
                                        document.getElementById("datanascimento").value = document.getElementById("diaSelecionadoInput").value;
                                    }

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