<%-- 
    Document   : conta
    Created on : 05/10/2018, 08:47:49
    Author     : Usuario
--%>

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
            String svalorEntrada = request.getParameter("valorentrada");
            String servico = request.getParameter("tipo");
            String svalorInicial = request.getParameter("valorinicial");
            String sparcelas = request.getParameter("parcelas");

            if (sparcelas.equals("")) {
                sparcelas = "1";
            }
            if (svalorEntrada.equals("")){
                svalorEntrada = "0";
            }

            double valorInicial = Double.parseDouble(svalorInicial);
            double valorEntrada = Double.parseDouble(svalorEntrada);
            valorInicial -= valorEntrada;
            int parcelas = Integer.parseInt(sparcelas);
            int idPessoa = Integer.parseInt(sidPessoa);
            int idUsuario = Integer.parseInt(sidUsuario);
            
            ControleServico cs = new ControleServico();
            ControleAluno ca = new ControleAluno();
            ControleConta cc = new ControleConta();
            ControleUsuario cu = new ControleUsuario();

            Conta c = ca.buscarContaAluno(idPessoa);
            Servico s = cs.buscarServicoPorNome(servico);
            Usuario u = cu.buscarUsuarioPorId(idUsuario);

            c.setValorInicial(valorInicial);
            c.setValorPago(0.0);
            c.setParcelas(parcelas);
            c.getServicos().add(s);
            
            cc.alterarConta(c);
           
           Registro r1 = new Registro(0, new Date(), new Date(), "Novo serviço vinculado à conta. Serviço - " + servico, true, false, c, u);
            
           ControleRegistro cr = new ControleRegistro();
           cr.inserirRegitro(r1);
           
           if(valorEntrada > 0){
               
               Registro r2 = new Registro(0, new Date(), new Date(), "Valor de entrada de R$" + valorEntrada, true, true, c, u);
            
               cr.inserirRegitro(r2);
           }
            
           response.sendRedirect("../mostrarConta.jsp?idPessoa="+sidPessoa);
        
        %>
