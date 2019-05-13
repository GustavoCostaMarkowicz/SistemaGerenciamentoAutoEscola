
        <%
            String placa = request.getParameter("placa");
            ControleVeiculo cv = new ControleVeiculo();
            cv.excluirVeiculo(cv.buscarVeiculosPorId(placa));
            response.sendRedirect("../index.jsp");        
        %>
   