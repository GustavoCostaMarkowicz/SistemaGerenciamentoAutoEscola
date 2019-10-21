<%-- 
    Document   : atualizarvalorpagamento
    Created on : 05/10/2019, 19:02:54
    Author     : João Vitor Gonçalves
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String svalorPago = request.getParameter("valorPago");
    String svalorParcela = request.getParameter("valorParcela");
    int acao = Integer.parseInt(request.getParameter("acao"));
    int ultimaParcela = Integer.parseInt(request.getParameter("ultimaParcela"));
    int parcelaSelecionada = Integer.parseInt(request.getParameter("parcelaSelecionada"));
    int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    double valorPago = Double.parseDouble(svalorPago.replace(",", "."));
    double valorParcela = Double.parseDouble(svalorParcela.replace(",", "."));
    
    ControleAluno ca = new ControleAluno();
    
    Conta c = ca.buscarContaAluno(idPessoa);
    
    DecimalFormat formato = new DecimalFormat("#.##");
    
    double valorEnviar;
    double troco;
    
    if(acao == 1){//checked = true
        if(parcelaSelecionada == ultimaParcela){
            troco = 0.0;
            valorEnviar = valorPago;
        } else{
            troco = valorParcela;
            for(int i = 1; i < ultimaParcela-parcelaSelecionada; i++){
                troco += c.getValorInicial()/c.getParcelas();
            }
            valorEnviar = valorPago - troco;
        }
    } else{//checked = false
        if(parcelaSelecionada == ultimaParcela){
            troco = valorParcela;
            valorEnviar = valorPago - troco;
        } else{
            troco = valorParcela;
            for(int i = 1; i <= ultimaParcela-parcelaSelecionada; i++){
                troco += c.getValorInicial()/c.getParcelas();
            }
            valorEnviar = valorPago - troco;
        }
    }
    System.out.println("ValorEnviar: "+valorEnviar);
%>

<a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">CANCELAR</a>      
<a id="confirmar" href="scripts/realizarpagamento.jsp?idPessoa=<%=idPessoa%>&idUsuario=<%=idUsuario%>&valorPago=<%=valorEnviar%>" class="modal-close waves-effect btn-flat" style="color: green;">CONFIRMAR</a>
<input type="hidden" id="trocoAjax" value="<%=formato.format(troco)%>">