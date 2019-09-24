<%-- 
    Document   : invalidarregistro
    Created on : 09/12/2018, 01:34:35
    Author     : João Vitor Gonçalves
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    int idRegistro = Integer.parseInt(request.getParameter("idRegistro"));
    String sIdPessoa = request.getParameter("idPessoa");

    int idPessoa = Integer.parseInt(sIdPessoa);

    ControleRegistro cr = new ControleRegistro();
    ControleConta cc = new ControleConta();
    ControleAluno ca = new ControleAluno();

    Registro r = cr.buscarRegistroPorId(idRegistro);
    Conta c = ca.buscarContaAluno(idPessoa);

    String sValorPagamento = "";
    double restanteParcela = (c.getValorInicial() - c.getValorPago()) % (c.getValorInicial() / c.getParcelas());

    if (r.getTextoRegistro().contains("entrada")) {
        Registro rc = cr.buscarRegistroPorId(idRegistro + 1);
        if (rc.getTextoRegistro().contains("ª parcela")) {
            c.setValorPago((c.getValorPago() - (c.getValorInicial() / c.getParcelas())));
        } else if (rc.getTextoRegistro().contains("Pagamento de R$")) {
            sValorPagamento = rc.getTextoRegistro().substring(15, rc.getTextoRegistro().lastIndexOf("."));
            double valorPagamento = Double.parseDouble(sValorPagamento);
            c.setValorPago((c.getValorPago() - valorPagamento));
            if (((restanteParcela + valorPagamento) > (c.getValorInicial() / c.getParcelas())) | restanteParcela == 0) {
                List<Registro> registros = cc.buscarRegistrosConta(idPessoa);
                int ordem = registros.size() - 1;
                for (; ordem >= 0; ordem--) {
                    if (registros.get(ordem).getTextoRegistro().contains("ª parcela") & registros.get(ordem).isValido()) {
                        Registro r2 = cr.buscarRegistroPorId(registros.get(ordem).getIdRegistro());
                        r2.setValido(!r2.isValido());
                        cr.alterarRegistro(r2);
                        ordem = -1;
                    }
                }
            }
        }
        r.setValido(!r.isValido());
        rc.setValido(!rc.isValido());
        cr.alterarRegistro(r);
        cr.alterarRegistro(rc);
        cc.alterarConta(c);
    } else {
        if (r.getTextoRegistro().contains("ª parcela")) {
            c.setValorPago((c.getValorPago() - (c.getValorInicial() / c.getParcelas())));
            Registro rc = cr.buscarRegistroPorId(idRegistro - 1);
            for(int i = 2; rc.getTextoRegistro().contains("Pagamento de R$"); i++){
                rc.setValido(!rc.isValido());
                cr.alterarRegistro(rc);
                cc.alterarConta(c);
                rc = cr.buscarRegistroPorId(idRegistro - i);
            }
        } else if (r.getTextoRegistro().contains("Pagamento de R$")) {
            sValorPagamento = r.getTextoRegistro().substring(15, r.getTextoRegistro().lastIndexOf("."));
            double valorPagamento = Double.parseDouble(sValorPagamento);
            c.setValorPago((c.getValorPago() - valorPagamento));
            if (((restanteParcela + valorPagamento) > (c.getValorInicial() / c.getParcelas())) | restanteParcela == 0) {
                List<Registro> registros = cc.buscarRegistrosConta(idPessoa);
                int ordem = registros.size() - 1;
                for (; ordem >= 0; ordem--) {
                    if (registros.get(ordem).getTextoRegistro().contains("ª parcela") & registros.get(ordem).isValido()) {
                        Registro r2 = cr.buscarRegistroPorId(registros.get(ordem).getIdRegistro());
                        r2.setValido(!r2.isValido());
                        cr.alterarRegistro(r2);
                        ordem = -1;
                    }
                }
            }         
        }
        r.setValido(!r.isValido());
        cr.alterarRegistro(r);
        cc.alterarConta(c);
    }

    response.sendRedirect("../mostrarConta.jsp?idPessoa=" + sIdPessoa);

%>
