<%-- 
    Document   : validarvalorpagamento
    Created on : 03/10/2019, 17:21:47
    Author     : João Vitor Gonçalves
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String svalorPago = request.getParameter("valorPago");
    int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    double valorPago = Double.parseDouble(svalorPago.replace(",", "."));
    double valorPagoFixo = valorPago;
    
    DecimalFormat formato = new DecimalFormat("#.##");
    
    ControleAluno ca = new ControleAluno();
    Conta c = ca.buscarContaAluno(idPessoa);
    Aluno a = ca.buscarAlunosPorId(idPessoa);
    
    if(c.getValorInicial()-c.getValorPago() < valorPago){
%>
    <div id="modal2" class="modal">
        <div class="modal-content">
            <h5>Erro durante pagamento</h5>
            <h6>O valor informado para pagamento é maior que o valor restante de pagamento para essa conta!</h6>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">FECHAR</a>
        </div>
    </div>
<%
    } else if(valorPago == 0.0){
%>
    <div id="modal2" class="modal">
        <div class="modal-content">
            <h5>Erro durante pagamento</h5>
            <h6>O valor informado para pagamento é inválido!</h6>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">FECHAR</a>
        </div>
    </div>
<%
    } else{
        double moduloConta = c.getValorPago()%(c.getValorInicial()/c.getParcelas());
        int numeroParcela = (int) ((c.getValorPago()-moduloConta)/(c.getValorInicial()/c.getParcelas()))+1;
        double valorParcela = c.getValorInicial()/c.getParcelas();
        double valorPParcela = (c.getValorInicial()-c.getValorPago())%(c.getValorInicial()/c.getParcelas());
        if(valorPParcela == 0.0){
            valorPParcela = valorParcela;
        }
        double valorUltimaParcela = valorPago;
        int contador = 1;
        double valorAtualP = valorPParcela;
        for(int i = numeroParcela; i <= c.getParcelas() & contador > 0; i++){
            if(i != numeroParcela){
                valorAtualP = valorParcela;
            }
            if(valorUltimaParcela <= valorParcela){
                contador = 0;
            } else if(i == numeroParcela){
                valorUltimaParcela -= valorPParcela;
            } else{
                valorUltimaParcela -= valorParcela;
            }
        }
        valorAtualP = valorPParcela;
%>
    <div id="modal2" class="modal">
        <div class="modal-content">
            <h5>Confirmar pagamento</h5>
            <h6>Deseja realmente realizar o pagamento de R$<%=valorPago%> para a conta de <%=a.getNomeCompleto()%>?<br>Selecione as parcelas das quais deseja descontar esse valor:
<%
        for(int i = numeroParcela; i <= c.getParcelas() & valorPago > 0.0; i++){
            if(i != numeroParcela){
                valorAtualP = valorParcela;
            }
            if(valorPago <= valorAtualP){
%>
            <p>
                <label>
                    <input onclick="controleCB(<%=i%>, <%=idPessoa%>, <%=idUsuario%>, <%=valorPagoFixo%>, <%=valorUltimaParcela%>);" id="cb<%=i%>" name="cb<%=i%>" value="<%=valorPago%>" type="checkbox" class="filled-in" checked="checked"/>
                    <span class="black-text"><%=i%>ª parcela - R$<%=formato.format(valorPago)%></span>
                </label>
            </p>
            <input type="hidden" id="ultimaParcela" value="<%=i%>">
<%
            if(i == numeroParcela){              
%>
            <input type="hidden" id="primeiraParcela" value="<%=i%>">
<%
            }
            valorPago = 0;
            } else if(i == numeroParcela){
%>
            <p>
                <label>
                    <input onclick="controleCB(<%=i%>, <%=idPessoa%>, <%=idUsuario%>, <%=valorPagoFixo%>, <%=valorUltimaParcela%>);" id="cb<%=i%>" name="cb<%=i%>" value="<%=valorPParcela%>" type="checkbox" class="filled-in" checked="checked"/>
                    <span class="black-text"><%=i%>ª parcela - R$<%=formato.format(valorPParcela)%></span>
                </label>
            </p>
            <input type="hidden" id="primeiraParcela" value="<%=i%>">
<%
            valorPago -= valorPParcela;
            } else{
%>
            <p>
                <label>
                    <input onclick="controleCB(<%=i%>, <%=idPessoa%>, <%=idUsuario%>, <%=valorPagoFixo%>, <%=valorUltimaParcela%>);" id="cb<%=i%>" name="cb<%=i%>" value="<%=valorParcela%>" type="checkbox" class="filled-in" checked="checked"/>
                    <span class="black-text"><%=i%>ª parcela - R$<%=formato.format(valorParcela)%></span>
                </label>
            </p>
<%
            valorPago -= valorParcela;
            }
%>
<%
        }
%>
            <br>
            <div id="troco" name="troco" style="border-style: solid;border-width: 1px;padding: 4px;">Troco: R$0,00</div>
            </h6>
        </div>
        <div id="modalRodape" class="modal-footer">
            <a href="#!" class="modal-close waves-effect btn-flat" style="color: red;">CANCELAR</a>      
            <a id="confirmar" href="scripts/realizarpagamento.jsp?idPessoa=<%=idPessoa%>&idUsuario=<%=idUsuario%>&valorPago=<%=valorPagoFixo%>" class="modal-close waves-effect btn-flat" style="color: green;">CONFIRMAR</a>
        </div>
    </div>    
<%
    }
%>
