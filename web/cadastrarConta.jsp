<%-- 
    Document   : cadastrarConta
    Created on : 02/10/2018, 21:55:27
    Author     : Usuario
--%>

<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Conta</title>
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

        div#infopgdiv {
            visibility: hidden;
            display: none;
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
            width: 305px;
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

        .cabecalhoCal {
            display: inline-block;
        }

    </style>
    <%    session = request.getSession();
        Usuario u = (Usuario) session.getAttribute("usuario");
        boolean logado = false;
        if (u != null) {
            logado = true;
        }

        ControleAluno ca = new ControleAluno();

        int idAluno = Integer.parseInt(request.getParameter("idPessoa"));
        String nome = ca.buscarAlunosPorId(idAluno).getNomeCompleto();
    %>
    <body>

        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>

        <main id="principal">



            <form  action="scripts/cadastrarconta.jsp" method="POST">

                <%
                    if (u != null) {
                %> <input type="hidden" name="idusuario" value="<%=u.getIdUsuario()%>"/>
                <%
                    }
                %>
                <div class="col s14 m12">
                    <div class="card">
                        <div class="card-content">

                            <div id="titulo" class="amber">
                                <h5 align="center">Cadastrar Conta</h5>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Aluno</h6>
                            </div>

                            <input placeholder="" value="<%=idAluno%>" id="id" name="id" type="hidden">

                            <div class="center row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">person</i>
                                    <input placeholder="" value="<%=nome%>" id="nome" name="nome" type="text" disabled>
                                    <label for="nome">Nome Completo</label>
                                </div>              
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Serviço</h6>
                            </div>
                            <div class="row">
                                <div>
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">attach_file</i>
                                        <select id="servico" name="servico" class="validate" required onchange="mostrarOpcoesParcelas(this.value)">
                                            <option value="" disabled selected>Serviços</option>
                                            <%
                                                ControleServico cs = new ControleServico();
                                                for (Servico servicos : cs.buscarTodosServicos()) {
                                                    if (servicos.isVisivel()) {
                                            %>
                                            <option value="<%=servicos.getTipoServico()%>"><%=servicos.getTipoServico()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <label>Selecione o serviço a ser prestado pelo aluno</label>
                                        <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                    </div>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados do Pagamento</h6>
                            </div>

                            <div class="center row">
                                <div class="input-field col s1">
                                    <a onclick="habilitarInput()" value="" class="amber tooltipped btn-floating waves-effect waves-light" data-position="right" data-tooltip="preencher com valores personalizados"><i class="material-icons">border_color</i></a>
                                    <a onclick="mostrarOpcoesParcelas(document.getElementById('servico').value)" value="" class="amber tooltipped btn-floating waves-effect waves-light" data-position="right" data-tooltip="utilizar valores estabelecidos no cadastro"><i class="material-icons">dehaze</i></a>
                                </div>
                                <div id="infopg">
                                    <div class="input-field col s4">
                                        <input class="validate" required placeholder="" id="valorinicial" name="valorinicial" type="text" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                    return true;
                                                else
                                                    return false;">
                                        <label for="valorinicial">Valor Total</label>
                                        <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                    </div>
                                    <div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">local_parking</i>
                                            <input placeholder="" id="parcelas" name="parcelas" type="text" onkeyup onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                        return true;
                                                    else
                                                        return false;">
                                            <label for="parcelas">Parcelas</label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="valorentradavista" name="valorentradavista" value="">
                                <div class="input-field col s4">
                                    <i class="material-icons prefix">attach_money</i>
                                    <input placeholder="" id="valorentrada" name="valorentrada" type="text" onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode)))
                                                return true;
                                            else
                                                return false;">
                                    <label for="valorentrada">Valor de Entrada</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">today</i>
                                    <input type="text" id="datapp" name="datapp" data-target="modal1" class="modal-trigger" placeholder=""/>
                                    <label for="datapp">Data da Primeira Parcela</label>
                                    <span class="helper-text" data-error="Campo obrigatório!" data-success="Ok!"></span>
                                </div>
                            </div>

                            <div id="titulo">
                                <h6 align="center">Dados Adicionais</h6>
                            </div>

                            <div class="center row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">description</i>
                                    <textarea placeholder="" name="anotacoes" class="materialize-textarea"></textarea>
                                    <label for="anotacoes">Anotações</label>
                                </div>              
                            </div>

                            <div class="center input-field col s12">
                                <button class="green waves-effect waves-light btn col s6" type="submit">Salvar
                                </button>
                            </div>

                            <!--________MODAL________-->
                            <div id="modalCalendario">
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
                                    if (dataAtual.getDate() < 10) {
                                        diaAtual = "0" + String.valueOf(dataAtual.getDate());
                                    } else {
                                        diaAtual = String.valueOf(dataAtual.getDate());
                                    }
                                    if (mes < 10) {
                                        mesAtual = "0" + String.valueOf(mes + 1);
                                    } else {
                                        mesAtual = String.valueOf(mes + 1);
                                    }
                                    int ano = dataAtual.getYear() + 1900;
                                %>

                                <div id="modal1" class="modal modal-fixed-footer">
                                    <div class="modal-content">
                                        <div class="card horizontal">
                                            <div id="diaSelecionado" class="card-image blue-grey darken-3">
                                                <p align="center" style="color:transparent;">_</p>
                                                <input type="hidden" id="diaSelecionadoInput" value="26/08/2019">
                                                <p id="diaSelecionadoP1" align="left"><%=diaAtual%>/<%=mesAtual%>/<%=ano%></p>
                                                <p id="diaSelecionadoP2" align="left"><%=diaAtual%> de <%=mesC%> de <%=ano%></p> 
                                            </div>
                                            <div class="card-stacked">
                                                <div id="calendario" class="card-content">     
                                                    <div id="titulo" class="amber">
                                                        <div class="cabecalhoCal" style="width: 32%;" align="left"><a onclick="alterarMes(1,<%=mes%>,<%=ano%>)" class="amber btn-floating btn-small waves-effect waves-light"><i class="material-icons" style="color: black;">chevron_left</i></a></div>
                                                        <h6 class="cabecalhoCal" align="center" style="width: 35%;"><%=mesC%> <%=new Date().getYear() + 1900%></h6>
                                                        <div class="cabecalhoCal" style="width: 30%;" align="right"><a onclick="alterarMes(2,<%=mes%>,<%=ano%>)" class="amber btn-floating btn-small waves-effect waves-light"><i class="material-icons" style="color: black;">chevron_right</i></a></div>
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
                                        <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">Cancelar</a>
                                        <a href="#!" onclick="preencherDataCalendario()" class="modal-close waves-effect btn-flat" style="color: green;">Confirmar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </main>

        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>

    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
                                            function inicializarSelects() {
                                                $('select').formSelect();
                                            }

                                            function inicializarDicas() {
                                                $('.tooltipped').tooltip();
                                            }

                                            function inicializarModals() {
                                                $('.modal').modal({
                                                    inDuration: 0
                                                });
                                            }

                                            $(document).ready(inicializarSelects());

                                            $(document).ready(inicializarDicas());

                                            $(document).ready(inicializarModals());

                                            function habilitarInput() {
                                                var x = "</div><div><div class='input-field col s4'><input class='validate' required placeholder='' id='valorinicial' name='valorinicial' type='text' onkeypress='if (!isNaN(String.fromCharCode(window.event.keyCode)))return true;elsereturn false;'><label for='valorinicial'>Valor Total</label><span class='helper-text' data-error='Campo obrigatório!' data-success='Ok!'></span></div></div><div><div class='input-field col s3'><i class='material-icons prefix'>local_parking</i><input placeholder='' id='parcelas' name='parcelas' type='text' onkeypress='if (!isNaN(String.fromCharCode(window.event.keyCode)))return true;elsereturn false;'><label for='parcelas'>Parcelas</label></div></div>"
                                                document.getElementById("infopg").innerHTML = x;
                                                document.getElementById("valorentrada").disabled = false;
                                                document.getElementById("valorentrada").value = "";
                                                document.getElementById("valorentradavista").value = "";
                                            }

                                            function mostrarOpcoesParcelas(id) {
                                                var xhttp;
                                                xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function () {
                                                    if (this.readyState === 4 && this.status === 200) {
                                                        document.getElementById("infopg").innerHTML = this.responseText;
                                                        inicializarSelects();
                                                        inicializarDicas();
                                                        document.getElementById("valorentrada").disabled = false;
                                                        document.getElementById("valorentrada").value = "";
                                                        document.getElementById("valorentradavista").value = "";
                                                    }
                                                };
                                                xhttp.open("GET", "ajax/consultardadosservico.jsp?id=" + id, true);
                                                xhttp.send();
                                            }

                                            function verificarTipoPagamento(tipo, valor) {
                                                if (tipo === "1") {
                                                    document.getElementById("valorentrada").value = valor;
                                                    document.getElementById("valorentrada").disabled = true;
                                                    document.getElementById("valorentradavista").value = valor;
                                                } else {
                                                    document.getElementById("valorentradavista").value = "";
                                                    document.getElementById("valorentrada").value = "";
                                                    document.getElementById("valorentrada").disabled = false;
                                                }
                                            }

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
                                                document.getElementById("datapp").value = document.getElementById("diaSelecionadoInput").value;
                                            }

                                            function alterarMes(tipoAlteracao, mes, ano) {
                                                if (tipoAlteracao === 1) {
                                                    if (mes === 0) {
                                                        mes = 11;
                                                        ano -= 1;
                                                    } else {
                                                        mes -= 1;
                                                    }
                                                } else {
                                                    if (mes === 11) {
                                                        mes = 0;
                                                        ano += 1;
                                                    } else {
                                                        mes += 1;
                                                    }
                                                }
                                                var xhttp;
                                                xhttp = new XMLHttpRequest();
                                                xhttp.onreadystatechange = function () {
                                                    if (this.readyState === 4 && this.status === 200) {
                                                        document.getElementById("modalCalendario").innerHTML = this.responseText;
                                                        inicializarSelects();
                                                        inicializarModals();
                                                        $('#modal1').modal('open');
                                                    }
                                                };
                                                xhttp.open("GET", "ajax/alterarmescalendario.jsp?mes=" + mes + "&ano=" + ano, true);
                                                xhttp.send();
                                            }
    </script>
</html>