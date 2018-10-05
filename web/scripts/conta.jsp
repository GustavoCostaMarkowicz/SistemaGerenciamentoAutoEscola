<%-- 
    Document   : conta
    Created on : 05/10/2018, 08:47:49
    Author     : Usuario
--%>

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

            String sid = request.getParameter("id");
            String svalorEntrada = request.getParameter("valorentrada");
            String servico = request.getParameter("tipo");
            String svalorTotal = request.getParameter("valortotal");
            String sparcelas = request.getParameter("parcelas");

            if (sparcelas.equals("")) {
                sparcelas = "1";
            }

            double valorTotal = Double.parseDouble(svalorTotal);
            double valorEntrada = Double.parseDouble(svalorEntrada);
            int parcelas = Integer.parseInt(sparcelas);
            int id = Integer.parseInt(sid);

            ControleServico cs = new ControleServico();
            ControleAluno ca = new ControleAluno();

            Aluno a = ca.buscarAlunosPorId(id);

            List<Servico> servicoA = new ArrayList();

            Servico s = cs.buscarServicoPorNome(servico);
            

            servicoA.add(s);

            Conta c = new Conta(valorTotal, parcelas, a, servicoA);
            
            ControleConta cc = new ControleConta();
            cc.inserirConta(c);
            
            response.sendRedirect("../telainicial.jsp");
        
        %>
