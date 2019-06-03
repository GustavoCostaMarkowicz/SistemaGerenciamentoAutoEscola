<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%
            int idInstrutor = Integer.parseInt(request.getParameter("idPessoa"));
            ControleInstrutor ci = new ControleInstrutor();
            ci.excluirInstrutor(ci.buscarInstrutorPorId(idInstrutor));
            response.sendRedirect("../funcionario.jsp?p=1");        
        %>