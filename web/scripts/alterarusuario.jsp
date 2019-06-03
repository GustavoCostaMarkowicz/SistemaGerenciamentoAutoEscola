<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%


     request.setCharacterEncoding("UTF-8");
    
    int id = Integer.parseInt(request.getParameter("idUsuario"));
    String nomeCompleto = request.getParameter("nome");
    String login = request.getParameter("usuario");
    String cidade = request.getParameter("cidadeAtuacao");
    String telefone = request.getParameter("telefone");
    String telefoneCelular = request.getParameter("telefonecelular");
    String senha = request.getParameter("senha");
    
    Atendente a = new Atendente(nomeCompleto, telefone, telefoneCelular, id, login, senha, cidade, true);
    
    ControleAtendente ca = new ControleAtendente();
    ca.alterarAtendente(a);
    
    response.sendRedirect("../funcionario.jsp?p=2");


%>
