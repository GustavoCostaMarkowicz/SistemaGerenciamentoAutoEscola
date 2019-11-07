<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.itext.gerarPdf"%>
<%

    double valorPago = Double.parseDouble(request.getParameter("valorPago"));
    int id = Integer.parseInt(request.getParameter("idConta"));
    gerarPdf gp = new gerarPdf();
    ControleConta cc = new ControleConta();
    Conta c = cc.buscarContasPorId(id);
    gp.gerarPdfRecibo(request, response, c, valorPago);


%>
