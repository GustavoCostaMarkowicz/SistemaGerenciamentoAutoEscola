
        <%@page import="br.edu.ifpr.irati.jsp.controle.ControleVeiculo"%>
<%
            String placa = request.getParameter("placa");
            ControleVeiculo cv = new ControleVeiculo();
            cv.excluirVeiculo(cv.buscarVeiculosPorId(placa));
            response.sendRedirect("../veiculo.jsp");        
        %>
   