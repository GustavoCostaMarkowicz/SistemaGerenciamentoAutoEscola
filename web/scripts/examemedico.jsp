<%-- 
    Document   : exameMedico
    Created on : 06/10/2018, 22:29:03
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="java.util.Date"%>
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
        SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm");

        String sid = request.getParameter("id");
        String sdataExame = request.getParameter("dataexame");
        String shorarioExame = request.getParameter("horarioexame");
        String clinica = request.getParameter("clinica");
        String medico = request.getParameter("medico");
        String sreteste = request.getParameter("reteste");
        
        boolean reteste = false;
        
        if (sreteste.equals("Sim")){
            reteste = true;
        }
        
        int id = Integer.parseInt(sid);
        Date dataExame = sdf.parse(sdataExame);
        Date horarioExame = sdf1.parse(shorarioExame);
        
        ControleAluno ca = new ControleAluno();
        Aluno a = ca.buscarAlunosPorId(id);
        List<Aluno> alunos = new ArrayList();
        alunos.add(a);
        
        ExameMedico em = new ExameMedico(medico, clinica, 0, dataExame, horarioExame, 1, reteste, alunos);
        
        if (alunos.size() == 1) {
            
            ControleExameMedico cem = new ControleExameMedico();
            cem.inserirExameMedico(em);
            
        } else {
            System.out.println("Não é possível Cadastrar");
        }
    
    
        response.sendRedirect("../relacaoExameMedico.jsp");
        
        
        
        
        %>
    </body>
</html>
