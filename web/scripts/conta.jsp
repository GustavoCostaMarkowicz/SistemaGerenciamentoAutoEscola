

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
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

        <%

             response.sendRedirect("../aluno.jsp");
            
            request.setCharacterEncoding("UTF-8");

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            String sid = request.getParameter("id");
            String svalorEntrada = request.getParameter("valorentrada");
            String servico = request.getParameter("servico");
            String svalorTotal = request.getParameter("valortotal");
            String sparcelas = request.getParameter("parcelas");

            if (sparcelas.equals(null)) {
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
            
            System.out.println(s.getTipoServico());
            System.out.println(a.getNomeCompleto());

            servicoA.add(s);

            Conta c = new Conta(valorTotal, parcelas, a, servicoA);
            
            ControleConta cc = new ControleConta();
            cc.inserirConta(c);
            
              
            

        %>

