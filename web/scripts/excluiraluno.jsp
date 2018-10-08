<%@page import="br.edu.ifpr.irati.jsp.controle.ControleRegistro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Registro"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Conta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleConta"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
    ControleAluno ca = new ControleAluno();
    ControleExame ce = new ControleExame();
    ControleConta cc = new ControleConta();
    ControleRegistro cr = new ControleRegistro();
    List<Exame> exames = ca.buscarExamesPorAluno(idPessoa);
    Conta c = ca.buscarContaAluno(idPessoa);
    for(Exame e: exames){
        ce.excluirExame(e);
    }
    List<Registro> registros = cc.buscarRegistrosConta(idPessoa);
    for(Registro r: registros){
        cr.excluirRegistro(r);
    }
    cc.excluirConta(c);
    ca.excluirAluno(ca.buscarAlunosPorId(idPessoa));
    response.sendRedirect("../aluno.jsp");

%>