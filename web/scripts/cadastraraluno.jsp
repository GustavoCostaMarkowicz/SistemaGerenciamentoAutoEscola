<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    String nomeCompleto = request.getParameter("nome");
    String sData = request.getParameter("datanascimento");
    String sexo = request.getParameter("sexo");
    String rg = request.getParameter("rg");
    String orgaoRg = request.getParameter("orgaorg");
    String cpf = request.getParameter("cpf");
    String nomePai = request.getParameter("nomepai");
    String nomeMae = request.getParameter("nomemae");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String endereco = request.getParameter("endereco");
    String numero = request.getParameter("numero");
    String complemento = request.getParameter("complemento");
    String cep = request.getParameter("cep");
    String bairro = request.getParameter("bairro");
    String telefone = request.getParameter("telefone");
    String telefoneCelular = request.getParameter("telefonecelular");
    String suf = request.getParameter("uf");
    String estadoCivil = request.getParameter("estadocivil");
    String naturalidade = request.getParameter("naturalidade");
    String nacionalidade = request.getParameter("nacionalidade");
    String grauInstrucao = request.getParameter("grauinstrucao");
    String sdoadorOrgaos = request.getParameter("doadororgaos");
    String tipoSanguineo = request.getParameter("tiposanguineo");
    String email = request.getParameter("email");
    
    Date dataCadastro = new Date();
    Date dataNascimento = sdf.parse(sData);
    boolean doadorOrgaos = false;
    if (sdoadorOrgaos.equals("Sim")) {
        doadorOrgaos = true;
    }
    String uf = suf.toUpperCase();

    Aluno a = new Aluno(orgaoRg, uf, estadoCivil, nomePai, nomeMae, dataNascimento, naturalidade, nacionalidade, sexo, grauInstrucao, doadorOrgaos, tipoSanguineo, email, 0, nomeCompleto, dataCadastro, cidade, estado, endereco, numero, complemento, cep, bairro, telefone, telefoneCelular, rg, cpf);

    ControleAluno ca = new ControleAluno();
    ca.inserirAluno(a);
    
    response.sendRedirect("../aluno.jsp");

%>
