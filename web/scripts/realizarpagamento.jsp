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
    
    int idPessoa = Integer.parseInt(sIdPessoa);
    int idUsuario = Integer.parseInt(sIdUsuario);
    
    ControleUsuario cu = new ControleUsuario();
    Usuario u = cu.buscarUsuarioPorId(idUsuario);
    
    ControleAluno ca = new ControleAluno();
    ControleConta cc = new ControleConta();
    
    Conta c = ca.buscarContaAluno(idPessoa);
    
    double valorPago = c.getValorInicial()/c.getParcelas();
    
    c.setValorPago(c.getValorPago()+valorPago);
    cc.alterarConta(c);
    
    int numeroParcela = (int) (c.getValorPago()/(c.getValorInicial()/c.getParcelas()));
    
    Registro r1 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela", c, u);
            
    ControleRegistro cr = new ControleRegistro();
    cr.inserirRegitro(r1);
    
    response.sendRedirect("../mostrarConta.jsp?idPessoa="+sIdPessoa);
%>
