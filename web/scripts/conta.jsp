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
            valorTotal -= valorEntrada;
            int parcelas = Integer.parseInt(sparcelas);
            int id = Integer.parseInt(sid);
            int idUsuario = Integer.parseInt(sidUsuario);
            
            ControleServico cs = new ControleServico();
            ControleAluno ca = new ControleAluno();

            Aluno a = ca.buscarAlunosPorId(id);

            List<Servico> servicoA = new ArrayList();

            Servico s = cs.buscarServicoPorNome(servico);
            
            ControleUsuario cu = new ControleUsuario();
            
            Usuario u = cu.buscarUsuarioPorId(idUsuario);
 
            servicoA.add(s);

            Conta c = new Conta(valorTotal, parcelas, a, servicoA);
            
           ControleConta cc = new ControleConta();
           cc.inserirConta(c);
           
           Registro r1 = new Registro(0, new Date(), new Date(), "Conta aberta. Serviço - " + servico, c, u);
            
           ControleRegistro cr = new ControleRegistro();
           cr.inserirRegitro(r1);
           
           if(valorEntrada > 0){
               
               Registro r2 = new Registro(0, new Date(), new Date(), "Valor de entrada de R$ " + valorEntrada, c, u);
            
               cr.inserirRegitro(r2);
           }
            
           response.sendRedirect("../mostrarConta.jsp?idPessoa="+sid);
        
        %>
