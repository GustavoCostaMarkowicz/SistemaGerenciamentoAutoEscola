<%-- 
    Document   : conta
    Created on : 04/10/2018, 07:53:31
    Author     : Usuario
--%>

<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Servico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleServico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            request.setCharacterEncoding("UTF-8");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            
            String sid = request.getParameter("id");
            String svalorEntrada = request.getParameter("valorentrada");
            String servico = request.getParameter("servico");
            String svalorTotal = request.getParameter("valortotal");
            String sparcelas = request.getParameter("parcelas");
            
            if(sparcelas.equals(null)){
                sparcelas = "1";
            }
            
            double valorTotal = Double.parseDouble(svalorTotal);
            double valorEntrada = Double.parseDouble(svalorEntrada);
            int parcelas = Integer.parseInt(sparcelas);
            int id = Integer.parseInt(sid);
            
            ControleServico cs = new ControleServico();
            ControleAluno ca = new ControleAluno();
            
            Aluno a = ca.buscarAlunosPorId(id);
            
            List<Servico> servicoA = new ArrayList<>();
            
            Servico s = cs.buscarServicoPorNome(servico);
            
            servicoA.add(s);
            
            List<Registro> registros = new ArrayList<>();
           
            Conta c = new Conta(valorTotal, parcelas, a, registros, servicoA);
            
            Usuario usuario = new Usuario();
            
            Registro r = new Registro(0, new Date(), new Date(), "Criação da Conta com valor de entrada de: " + valorEntrada, c, usuario);

            
            registros.add(r);
            

        
        %>
    </body>
</html>
