<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    
    String sIdPessoa = request.getParameter("idPessoa");
    String numeroLicencaInstrutor = request.getParameter("numeroLicenca");
    String sDataValidadeLicenca = request.getParameter("dataValidadeLicenca");
    String tipoInstrucao = request.getParameter("tipoInstrucao");
    String situacao = request.getParameter("situacao");
    String nomeCompleto = request.getParameter("nome");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String endereco = request.getParameter("endereco");
    String numero = request.getParameter("numero");
    String bairro = request.getParameter("bairro");
    String telefoneCelular = request.getParameter("telefoneCelular");
    String telefone = request.getParameter("telefone");
    String rg = request.getParameter("rg");
    String cpf = request.getParameter("cpf");
    String sdataAdmissao = request.getParameter("dataAdmissao");
    String sdataCadastro = request.getParameter("dataCadastro");
    
    int idPessoa = Integer.parseInt(sIdPessoa);
    Date dataValidadeLicenca = null;
    if(sDataValidadeLicenca != null & !sDataValidadeLicenca.equals("")){
        dataValidadeLicenca = sdf.parse(sDataValidadeLicenca);
    }
    Date dataAdmissao = sdf.parse(sdataAdmissao);
    Date dataCadastro = sdf.parse(sdataCadastro);
    
    Instrutor i = new Instrutor(dataAdmissao, numeroLicencaInstrutor, dataValidadeLicenca, tipoInstrucao, situacao, idPessoa, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, null, null, bairro, telefone, telefoneCelular, rg, cpf);

    ControleInstrutor ci = new ControleInstrutor();
    ci.alterarInstrutor(i);
    
    response.sendRedirect("../funcionario.jsp?p=1");

%>
