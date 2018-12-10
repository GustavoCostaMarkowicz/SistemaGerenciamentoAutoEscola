<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Usuario"%>
<%


    request.setCharacterEncoding("UTF-8");

    String login = request.getParameter("nome");
    String cidade = request.getParameter("cidade");
    String telefone = request.getParameter("telefone");
    String telefoneCelular = request.getParameter("telefonecelular");
    String senha = request.getParameter("senha");
    
    Atendente a = new Atendente(login, telefone, telefoneCelular, 0, login, senha, cidade, true);
    
    ControleAtendente ca = new ControleAtendente();
    ca.inserirAtendente(a);
    
    response.sendRedirect("../telaInicial.jsp");


%>
