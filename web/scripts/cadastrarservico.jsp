<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegraParcela"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.RegraParcelas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%



    request.setCharacterEncoding("UTF-8");
    
    ControleRegraParcela crp = new ControleRegraParcela();
    
    String tipoServico = request.getParameter("nome");
    double valorVista = Double.parseDouble(request.getParameter("valorVista"));
    int qnt = Integer.parseInt(request.getParameter("quantidade"));
    
    List<RegraParcelas> rps = new ArrayList();
    
    Servico s = new Servico(tipoServico, valorVista, rps);
    
    for(int i = 1; i <= qnt; i++){
        
        int parcela = Integer.parseInt(request.getParameter("parcela"+String.valueOf(i)));
        double valor = Double.parseDouble(request.getParameter("valor"+String.valueOf(i)));
        
        RegraParcelas rp = new RegraParcelas(0, parcela, valor, s);
        
        crp.inserirRegraParcelas(rp);
        rps.add(rp);
        
        
    }
   
    s.setParcelas(rps);
    
    ControleServico cs = new ControleServico();
    
    
    cs.inserirServico(s);
    
    response.sendRedirect("../servico.jsp");
    
    









%>