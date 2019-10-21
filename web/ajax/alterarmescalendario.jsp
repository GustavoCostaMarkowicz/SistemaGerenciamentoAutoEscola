<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int mes = Integer.parseInt(request.getParameter("mes"));
    int ano = Integer.parseInt(request.getParameter("ano"));
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
    if (mes < 10) {
        mesAtual = "0" + String.valueOf(mes + 1);
    } else {
        mesAtual = String.valueOf(mes + 1);
    }
    String sDataAtual = diaAtual + "/" + mesAtual + "/" + String.valueOf(ano);
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date dataAtual = sdf.parse(sDataAtual);
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
                        <h6 class="cabecalhoCal" align="center" style="width: 35%;"><%=mesC%> <%=ano%></h6>
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
        <a href="#!" class="modal-close waves-effect waves-green btn-flat" style="color: red;">Cancelar</a>
        <a href="#!" onclick="preencherDataCalendario()" class="modal-close waves-effect waves-green btn-flat" style="color: green;">Confirmar</a>
    </div>
</div>
