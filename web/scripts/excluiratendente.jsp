<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAtendente"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Atendente"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleUsuario"%>
<%


      String sId = request.getParameter("idusuario");
      
      int id = Integer.parseInt(sId);
      
      ControleAtendente ca = new ControleAtendente();
      Atendente a = ca.buscarAtendentePorId(id);
      
      a.setVisivel(false);
      
      ca.alterarAtendente(a);
      
      response.sendRedirect("../cadastrarUsuario.jsp");





%>
