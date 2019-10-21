<%-- 
    Document   : realizarpagamento
    Created on : 02/12/2018, 15:56:49
    Author     : João Vitor Gonçalves
--%>

<%@page import="java.text.DecimalFormat"%>
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

    DecimalFormat formato = new DecimalFormat("#.##");

    int idPessoa = Integer.parseInt(sIdPessoa);
    int idUsuario = Integer.parseInt(sIdUsuario);
    double valorPago = Double.parseDouble(sValorPago.replace(",", "."));

    ControleUsuario cu = new ControleUsuario();
    Usuario u = cu.buscarUsuarioPorId(idUsuario);

    ControleAluno ca = new ControleAluno();
    ControleConta cc = new ControleConta();

    Conta c = ca.buscarContaAluno(idPessoa);
    
    double valorPParcela = (c.getValorInicial() - c.getValorPago()) % (c.getValorInicial() / c.getParcelas());
    double moduloConta = c.getValorPago() % (c.getValorInicial() / c.getParcelas());
    double moduloValorPago = valorPago % (c.getValorInicial() / c.getParcelas());
    int numeroParcela = (int) ((c.getValorPago() - moduloConta) / (c.getValorInicial() / c.getParcelas())) + 1;

    c.setValorPago(c.getValorPago() + valorPago);
    cc.alterarConta(c);

    int qtdParcela = (int) ((valorPago - moduloValorPago) / (c.getValorInicial() / c.getParcelas()));

    ControleRegistro cr = new ControleRegistro();
    
    if (valorPParcela == 0.0 | valorPParcela > valorPago) {
        for (; qtdParcela > 0; qtdParcela--) {
            Registro r1 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
            cr.inserirRegitro(r1);
            numeroParcela++;
        }
        if (moduloValorPago > 0) {
            Registro r2 = new Registro(0, new Date(), new Date(), "Pagamento de R$" + formato.format(moduloValorPago) + ". Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
            cr.inserirRegitro(r2);
        }
    } else {
        Registro r1 = new Registro(0, new Date(), new Date(), "Pagamento de R$" + formato.format(valorPParcela) + ". Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
        Registro r2 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
        cr.inserirRegitro(r1);
        cr.inserirRegitro(r2);
        numeroParcela++;
        valorPago -= valorPParcela;
        moduloValorPago = valorPago % (c.getValorInicial() / c.getParcelas());
        qtdParcela = (int) ((valorPago - moduloValorPago) / (c.getValorInicial() / c.getParcelas()));
        for (; qtdParcela > 0; qtdParcela--) {
            Registro r3 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
            cr.inserirRegitro(r3);
            numeroParcela++;
        }
        if (moduloValorPago > 0) {
            Registro r4 = new Registro(0, new Date(), new Date(), "Pagamento de R$" + formato.format(moduloValorPago) + ". Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
            cr.inserirRegitro(r4);
        }
    }

    response.sendRedirect("../mostrarConta.jsp?idPessoa=" + sIdPessoa);
%>
