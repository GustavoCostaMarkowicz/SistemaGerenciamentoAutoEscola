<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int mes = Integer.parseInt(request.getParameter("mes"));
    int ano = Integer.parseInt(request.getParameter("ano"));
    int p = Integer.parseInt(request.getParameter("p"));
%>
<%
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
        if (ano % 4 == 0 & (ano % 100 != 0 | ano % 400 == 0)) {
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

    String diaAtual = "01";
    String mesAtual;
    if (mes < 9) {
        mesAtual = "0" + String.valueOf(mes + 1);
    } else {
        mesAtual = String.valueOf(mes + 1);
    }
    String sDataAtual = diaAtual + "/" + mesAtual + "/" + String.valueOf(ano);
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date dataAtual = sdf.parse(sDataAtual);

    ControleExame ce = new ControleExame();
    List<Exame> exames = ce.buscarTodosExames();
    int qtdE;
    String div = "";

    if (p == 1) {
%>

<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <div class="card horizontal">
            <div id="diaSelecionado" class="card-image blue-grey darken-3">
                <p align="center" style="color:transparent;">_</p>
                <input type="hidden" id="diaSelecionadoInput" value="<%=sDataAtual%>">
                <p id="diaSelecionadoP1" align="left"><%=diaAtual%>/<%=mesAtual%>/<%=ano%></p>
                <p id="diaSelecionadoP2" align="left"><%=diaAtual%> de <%=mesC%> de <%=ano%></p> 
            </div>
            <div class="card-stacked">
                <div id="calendario" class="card-content">     
                    <div id="titulo" class="amber">
                        <div class="cabecalhoCal" style="width: 32%;" align="left"><a onclick="alterarMes(1,<%=mes%>,<%=ano%>, 1)" class="amber btn-floating btn-small waves-effect waves-light"><i class="material-icons" style="color: black;">arrow_back</i></a></div>
                        <h6 class="cabecalhoCal" align="center" style="width: 35%;"><%=mesC%> <%=ano%></h6>
                        <div class="cabecalhoCal" style="width: 30%;" align="right"><a onclick="alterarMes(2,<%=mes%>,<%=ano%>, 1)" class="amber btn-floating btn-small waves-effect waves-light"><i class="material-icons" style="color: black;">arrow_forward</i></a></div>
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
                                <td id="<%=dia%>" class="menu"><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=ano%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
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
                                <td id="<%=dia%>" class="menu" ><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=ano%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
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
                                <td id="<%=dia%>" class="menu" ><a href="#" onclick="diaFocado(<%=dia%>,<%=mes + 1%>, '<%=mesC%>',<%=ano%>)"><div class="dia" style="height:100%;width:100%;"><%=dia%></div></a></td> 
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
        <a href="#" class="modal-close waves-effect waves-green btn-flat" style="color: red;">Cancelar</a>
        <a href="#" onclick="preencherDataCalendario()" class="modal-close waves-effect waves-green btn-flat" style="color: green;">Confirmar</a>
    </div>
</div>
<%} else {%>
<div id="titulo" class="amber">
    <h6 align="center">Consulta de Exames</h6>
    <div class="cabecalhoCal" style="width: 25%;" align="left"><a onclick="alterarMes(1,<%=mes%>,<%=ano%>, 2)" class="amber btn-floating btn-medium waves-effect waves-light"><i class="material-icons" style="color: black;">arrow_back</i></a></div>
    <h5 class="cabecalhoCal" style="width: 50%;" align="center"><%=mesC%> <%=ano%></h5>
    <div class="cabecalhoCal" style="width: 24%;" align="right"><a onclick="alterarMes(2,<%=mes%>,<%=ano%>, 2)" class="amber btn-floating btn-medium waves-effect waves-light"><i class="material-icons" style="color: black;">arrow_forward</i></a></div>
</div>
<table id="calendario" name="calendario" class="highlight centered">
    <thead>
        <tr>
            <th>Domingo</th>
            <th>Segunda</th>
            <th>Terça<label class="prchto">BB</label></th>
            <th>Quarta<label class="prchto">B</label></th>
            <th>Quinta<label class="prchto">B</label></th>
            <th>Sexta<label class="prchto">BB</label></th>
            <th>Sábado<label class="prchto">B</label></th>
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
                    //qtdE = quantidade de exames em um determinado dia
                    qtdE = 0;
                    //Verifica a quantidade de exames para o dia do mês em execução
                    for (Exame e : exames) {
                        if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == ano & e.isVisivel()) {
                            qtdE++;
                        }
                    }
                    //div = texto à ser mostrado na tela com a quantidade de exames do dia do mês em execução
                    if (qtdE == 1) {
                        div = String.valueOf(qtdE) + " exame";
                    } else {
                        div = String.valueOf(qtdE) + " exames";
                    }
                    //Verifica se o dia do mês em execução possui exames cadastrados
                    if (qtdE > 0) {
                        //Caso sim: mostra um campo da tabela com a quantidade de exames naquele determinado dia
            %>
            <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                        <%
                            dia++;
                        } else {
                            //Caso não: mostra um campo padrão da tabela
                        %>
            <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                <%
                            dia++;
                        }
                    }
                    //Preenche as demais linhas do calendário
                } else {
                    //Inicia o preenchimento da linha de domingo à sábado
                    for (int k = diaSControle; k <= 6; k++) {
                        //Verifica se o dia do mês em execução é o último do mês
                        if (dia == diaF) {
                            //Caso sim: preenche o último dia no calendário pelo mesmo método da linha do primeiro dia
                            qtdE = 0;
                            for (Exame e : exames) {
                                if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == ano & e.isVisivel()) {
                                    qtdE++;
                                }
                            }
                            if (qtdE == 1) {
                                div = String.valueOf(qtdE) + " exame";
                            } else {
                                div = String.valueOf(qtdE) + " exames";
                            }
                            if (qtdE > 0) {
                %><td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> <%
                } else {
                        %>
            <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                <%
                    }
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
                    //Caso não: preenche todos os dias do calendário que estão entre a primeira e a última linha, pelo mesmo método da linha do primeiro dia 
                    qtdE = 0;
                    for (Exame e : exames) {
                        if (e.getDataExame().getDate() == dia & e.getDataExame().getMonth() == mes & e.getDataExame().getYear() == ano & e.isVisivel()) {
                            qtdE++;
                        }
                    }
                    if (qtdE == 1) {
                        div = String.valueOf(qtdE) + " exame";
                    } else {
                        div = String.valueOf(qtdE) + " exames";
                    }
                    if (qtdE > 0) {
            %>
            <td class="menu" ><a href="examesCalendario.jsp?dia=<%=dia%>&p=0"><div class="dia" style="height:100%;width:100%;"><%=dia + "<br>"%><i style="font-size: 15px; color: green;" class="material-icons">event</i><label class="dataEx"><%=div%></label></div></a></td> 
                        <%
                            dia++;
                        } else {
                        %>
            <td class="menu" ><div class="dia" style="height:100%;width:100%;"><%=dia%></div></td> 
                <%
                                    dia++;

                                }
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
<%}%>
