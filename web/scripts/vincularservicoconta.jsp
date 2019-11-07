<%-- 
    Document   : conta
    Created on : 05/10/2018, 08:47:49
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegraParcela"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    String sidUsuario = request.getParameter("idusuario");
    String sidPessoa = request.getParameter("idpessoa");
    String svalorEntrada = "";
    String valorEntradaVista = request.getParameter("valorentradavista");
    if (valorEntradaVista.equals("")) {
        svalorEntrada = request.getParameter("valorentrada");
    } else {
        svalorEntrada = valorEntradaVista;
    }
    String servico = request.getParameter("servico");
    String sparcelas = "";
    String svalorInicial = "";
    String sDataPP = request.getParameter("datapp");
    
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    Date dataPP = sdf.parse(sDataPP);
    
    ControleServico cs = new ControleServico();
    Servico s = cs.buscarServicoPorNome(servico);

    if (request.getParameter("valorBD") != null) {
        sparcelas = request.getParameter("valorBD");
        if (sparcelas.equals("1")) {
            svalorInicial = String.valueOf(s.getValorVista());
        } else {
            ControleRegraParcela crp = new ControleRegraParcela();
            List<RegraParcelas> rps = crp.buscarRegraParcelasPorServico(s);
            for (RegraParcelas rp : rps) {
                if (sparcelas.equals(String.valueOf(rp.getParcela()))) {
                    svalorInicial = String.valueOf(rp.getValorParcelado() * Integer.parseInt(sparcelas));
                }
            }
        }
    } else {
        svalorInicial = request.getParameter("valorinicial");
        sparcelas = request.getParameter("parcelas");
    }

    if (sparcelas.equals("")) {
        sparcelas = "1";
    }
    if (svalorEntrada.equals("")) {
        svalorEntrada = "0";
    }

    double valorInicial = Double.parseDouble(svalorInicial);
    double valorPago = 0.0;
    int parcelas = Integer.parseInt(sparcelas);
    int id = Integer.parseInt(sidPessoa);
    int idUsuario = Integer.parseInt(sidUsuario);

    ControleUsuario cu = new ControleUsuario();

    Usuario u = cu.buscarUsuarioPorId(idUsuario);
    
    ControleConta cc = new ControleConta();
    
    ControleAluno ca = new ControleAluno();

    Conta c = ca.buscarContaAluno(id);

    c.setValorInicial(valorInicial);
    c.setValorPago(valorPago);
    c.setParcelas(parcelas);
    c.getServicos().add(s);
    c.setMesPrimeiraParcela(dataPP);
    
    cc.alterarConta(c);
    
    ControleRegistro cr = new ControleRegistro();
    
    List<Registro> registros = cc.buscarRegistrosConta(id);
    for(Registro r: registros){
        r.setInvalidavel(false);
        cr.alterarRegistro(r);
    }

    Registro r1 = new Registro(0, new Date(), new Date(), "Novo serviço vinculado à conta. Serviço - " + servico + ". Valor total - R$" + valorInicial, "", true, false, c, u);
    cr.inserirRegitro(r1);

    valorPago = Integer.parseInt(svalorEntrada);
    if (valorPago > 0) {
        Registro r2 = new Registro(0, new Date(), new Date(), "Valor de entrada de R$" + valorPago + ". Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, true, c, u);
        cr.inserirRegitro(r2);
        
        double moduloConta = c.getValorPago() % (c.getValorInicial() / c.getParcelas());
        double moduloValorPago = valorPago % (c.getValorInicial() / c.getParcelas());
        int numeroParcela = (int) ((c.getValorPago() - moduloConta) / (c.getValorInicial() / c.getParcelas())) + 1;

        c.setValorPago(c.getValorPago() + valorPago);
        cc.alterarConta(c);

        int qtdParcela = (int) ((valorPago - moduloValorPago) / (c.getValorInicial() / c.getParcelas()));

        for (; qtdParcela > 0; qtdParcela--) {
            Registro r3 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, false, c, u);
            cr.inserirRegitro(r3);
            numeroParcela++;
        }

        if (moduloValorPago > 0) {
            Registro r3 = new Registro(0, new Date(), new Date(), "Pagamento de R$" + moduloValorPago + ". Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, false, c, u);
            cr.inserirRegitro(r3);
            if (moduloConta > 0) {
                if ((moduloConta + moduloValorPago) >= (c.getValorInicial() / c.getParcelas())) {
                    Registro r4 = new Registro(0, new Date(), new Date(), "Pagamento da " + numeroParcela + "ª parcela. Serviço - " + c.getServicos().get((c.getServicos().size() - 1)).getTipoServico(), "", true, false, c, u);
                    cr.inserirRegitro(r4);
                }
            }
        }
    }

    response.sendRedirect("../mostrarConta.jsp?idPessoa=" + sidPessoa + "&valorPago=" + valorPago);

%>
