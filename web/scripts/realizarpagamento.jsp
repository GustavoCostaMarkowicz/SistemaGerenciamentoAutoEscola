<%-- 
    Document   : realizarpagamento
    Created on : 02/12/2018, 15:56:49
    Author     : João Vitor Gonçalves
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sIdPessoa = request.getParameter("idPessoa");
    String sIdUsuario = request.getParameter("idUsuario");
    String sValorPago = request.getParameter("valorPago");
    
    int idPessoa = Integer.parseInt(sIdPessoa);
    int idUsuario = Integer.parseInt(sIdUsuario);
    int valorPago = Integer.parseInt(sValorPago);
    
    ControleUsuario cu = new ControleUsuario();
    Usuario u = cu.buscarUsuarioPorId(idUsuario);
    
    ControleAluno ca = new ControleAluno();
    ControleConta cc = new ControleConta();
    
    Conta c = ca.buscarContaAluno(idPessoa);
    
    double moduloConta = c.getValorPago()%(c.getValorInicial()/c.getParcelas());
    double moduloValorPago = valorPago%(c.getValorInicial()/c.getParcelas());
    int numeroParcela = (int) ((c.getValorPago()-moduloConta)/(c.getValorInicial()/c.getParcelas()))+1;
    
    c.setValorPago(c.getValorPago()+valorPago);
    cc.alterarConta(c);
    
    int qtdParcela = (int) ((valorPago-moduloValorPago)/(c.getValorInicial()/c.getParcelas()));
    
    ControleRegistro cr = new ControleRegistro();
    
    for(; qtdParcela > 0; qtdParcela--){
        Registro r1 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size()-1)).getTipoServico(), true, true, c, u);
        cr.inserirRegitro(r1);
        numeroParcela++;
    }
    
    if(moduloValorPago > 0){
        Registro r2 = new Registro(0, new Date(), new Date(), "Pagamento de R$" + moduloValorPago + ". Serviço - " + c.getServicos().get((c.getServicos().size()-1)).getTipoServico(), true, true, c, u);
        cr.inserirRegitro(r2);
        if(moduloConta > 0){
            if((moduloConta + moduloValorPago) >= (c.getValorInicial()/c.getParcelas())){
                Registro r3 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size()-1)).getTipoServico(), true, true, c, u);
                cr.inserirRegitro(r3);
            }
        }
    }
    
    response.sendRedirect("../mostrarConta.jsp?idPessoa="+sIdPessoa);
%>
