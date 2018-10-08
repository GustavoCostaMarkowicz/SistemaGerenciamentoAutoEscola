<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    String sIdPessoa = request.getParameter("idPessoa");
    String numeroLicencaInstrutor = request.getParameter("numerolicenca");
    String sDataValidadeLicenca = request.getParameter("datavalidadelicenca");
    String tipoInstrucao = request.getParameter("tipoinstrucao");
    String situacao = request.getParameter("situacao");
    String nomeCompleto = request.getParameter("nome");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String endereco = request.getParameter("endereco");
    String numero = request.getParameter("numero");
    String bairro = request.getParameter("bairro");
    String telefoneCelular = request.getParameter("telefonecelular");
    String rg = request.getParameter("rg");
    String cpf = request.getParameter("cpf");
    
    int idPessoa = Integer.parseInt(sIdPessoa);
    Date dataValidadeLicenca = sdf.parse(sDataValidadeLicenca);
    Date dataAdmissao = new Date();
    Date dataCadastro = new Date();
    
    Instrutor i = new Instrutor(dataAdmissao, numeroLicencaInstrutor, dataValidadeLicenca, tipoInstrucao, situacao, idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, null, null, bairro, null, telefoneCelular, rg, cpf);

    ControleInstrutor ci = new ControleInstrutor();
    ci.alterarInstrutor(i);
    
    response.sendRedirect("../instrutor.jsp");

%>
