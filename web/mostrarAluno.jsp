<%-- 
    Document   : mostrarAluno
    Created on : 02/10/2018, 21:40:04
    Author     : Usuario
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações do Aluno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    </head>

    <style>

        div#titulo {
            background-color: lightgray;
            padding: 3px;
        }

        div#titulo h5 {
            font-weight: bold;
        }

        div#titulo h6 {
            font-weight: bold;
        }

        td {
            border-right: solid 1px lightgrey; 
            border-left: solid 1px lightgrey;
        }

        label.nomeDado {
            font-weight: bold;
            color: black;
        }

    </style>

    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <%
            int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));
            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(idPessoa);

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String complemento;
            if (a.getComplemento() == null) {
                complemento = "";
            } else {
                complemento = a.getComplemento();
            }
            String estadoCivil;
            if (a.getEstadoCivil() == null) {
                estadoCivil = "";
            } else {
                estadoCivil = a.getEstadoCivil();
            }
            String grauInstrucao;
            if (a.getGrauInstrucao() == null) {
                grauInstrucao = "";
            } else {
                grauInstrucao = a.getGrauInstrucao();
            }
            String naturalidade;
            if (a.getNaturalidade() == null) {
                naturalidade = "";
            } else {
                naturalidade = a.getNaturalidade();
            }
            String nacionalidade;
            if (a.getNacionalidade() == null) {
                nacionalidade = "";
            } else {
                nacionalidade = a.getNacionalidade();
            }
            String tipoSanguineo;
            if (a.getTipoSanguineo() == null) {
                tipoSanguineo = "";
            } else {
                tipoSanguineo = a.getTipoSanguineo();
            }
            String doadorOrgaos;
            if (a.isDoadorOrgaos() == true) {
                doadorOrgaos = "Sim";
            } else if (a.isDoadorOrgaos() == false) {
                doadorOrgaos = "Não";
            } else {
                doadorOrgaos = "";
            }
            String telefone;
            if (a.getTelefone() == null) {
                telefone = "";
            } else {
                telefone = a.getTelefone();
            }
            String telefoneCelular;
            if (a.getTelefoneCelular() == null) {
                telefoneCelular = "";
            } else {
                telefoneCelular = a.getTelefoneCelular();
            }
            String email;
            if (a.getEmail() == null) {
                email = "";
            } else {
                email = a.getEmail();
            }
        %>
        <div class="col s14 m12">
            <div class="card" align="center">
                <div class="card-content">
                    <div id="titulo" class="amber">
                        <h5 align="center"><%=a.getNomeCompleto()%></h5>
                    </div>
                    <div id="titulo">
                        <h6 align="center">Dados Pessoais</h6>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">NÚMERO DO PROCESSO: </label><%=a.getProcesso()%></td>
                                <td><label class="nomeDado">DATA DE NASCIMENTO: </label><%=sdf.format(a.getDataNascimento())%></td>
                                <td><label class="nomeDado">DATA DE CADASTRO: </label><%=sdf.format(a.getDataCadastro())%></td>
                                <td><label class="nomeDado">CPF: </label><%=a.getCpf()%></td>
                                <td><label class="nomeDado">RG: </label><%=a.getRg()%></td>
                            </tr>                           
                        </tbody>
                    </table>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">ÓRGÃO EMISSOR DO RG: </label><%=a.getOrgaoRg()%></td>
                                <td><label class="nomeDado">UF: </label><%=a.getUf()%></td>
                                <td><label class="nomeDado">SEXO: </label><%=a.getSexo()%></td>
                                <td><label class="nomeDado">NOME DO PAI: </label><%=a.getNomePai()%></td>
                                <td><label class="nomeDado">NOME DA MÃE: </label><%=a.getNomeMae()%></td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="titulo">
                        <h6 align="center">Dados de Moradia</h6>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">CIDADE: </label><%=a.getCidade()%></td>
                                <td><label class="nomeDado">ESTADO: </label><%=a.getEstado()%></td>
                                <td><label class="nomeDado">ENDEREÇO: </label><%=a.getEndereco()%></td>
                            </tr>                           
                        </tbody>
                    </table>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">NÚMERO: </label><%=a.getNumero()%></td>
                                <td><label class="nomeDado">COMPLEMENTO: </label><%=complemento%></td>
                                <td><label class="nomeDado">CEP: </label><%=a.getCep()%></td>
                                <td><label class="nomeDado">BAIRRO: </label><%=a.getBairro()%></td>
                            </tr>                           
                        </tbody>
                    </table>        
                    <div id="titulo">
                        <h6 align="center">Dados Adicionais</h6>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">ESTADO CIVIL: </label><%=estadoCivil%></td>
                                <td><label class="nomeDado">GRAU DE INSTRUÇÃO: </label><%=grauInstrucao%></td>
                                <td><label class="nomeDado">NATURALIDADE: </label><%=naturalidade%></td>
                                <td><label class="nomeDado">NACIONALIDADE: </label><%=nacionalidade%></td>
                                <td><label class="nomeDado">DOADOR DE ÓRGÃOS: </label><%=doadorOrgaos%></td>
                                <td><label class="nomeDado">TIPO SANGUÍNEO: </label><%=tipoSanguineo%></td>
                            </tr>                           
                        </tbody>
                    </table>
                    <div id="titulo">
                        <h6 align="center">Contato</h6>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label class="nomeDado">TELEFONE: </label><%=telefone%></td>
                                <td><label class="nomeDado">TELEFONE CELULAR: </label><%=telefoneCelular%></td>
                                <td><label class="nomeDado">EMAIL: </label><%=email%></td>
                            </tr>                           
                        </tbody>
                    </table>
                </div>

                <%
                    if (ca.buscarContaAluno(a.getIdPessoa()) == null) {
                %>
                <div class="row">
                    <div class="center input-field col s12">
                        <a href="cadastrarConta.jsp?idPessoa=<%=a.getIdPessoa()%>" class="green waves-effect waves-light btn" type="submit">CADASTRAR CONTA</a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="row">
                        <div class="center input-field col s12">
                            <a href="mostrarConta.jsp?idPessoa=<%=a.getIdPessoa()%>" class="amber waves-effect waves-light btn" type="submit" style="color: black;">MOSTRAR CONTA</a>
                        </div>


                        <%
                            }
                        %>

                        <%
                            if (a.isVisivel()) {
                        %>

                        <div class="center input-field col s12">
                            <a href="scripts/finalizarprocesso.jsp?idPessoa=<%=a.getIdPessoa()%>&id=1" class="red waves-effect waves-light btn" type="submit">FINALIZAR PROCESSO</a>
                        </div>

                        <%
                        } else {
                        %>

                        <div class="center input-field col s12">
                            <a href="scripts/finalizarprocesso.jsp?idPessoa=<%=a.getIdPessoa()%>&id=2" class="yellow waves-effect waves-light btn" type="submit"></a>
                        </div>

                        <%
                            }
                        %>
                        <div class="center input-field col s12">
                            <a href="examesAluno.jsp?idPessoa=<%=a.getIdPessoa()%>" class="amber waves-effect waves-light btn" type="submit" style="color: black;">EXAMES DO ALUNO</a>
                        </div>
                        <div class="center input-field col s12">
                         <a href="scripts/gerarRelatorioMatricula.jsp?idPessoa=<%=a.getIdPessoa()%>" class="amber waves-effect waves-light btn" type="submit" style="color: black;">GERAR RELATÓRIO DE MATRÍCULA</a>                   
                        </div>
                        <!-- -->
                    </div>
                </div>

            </div>
        </div>
        
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>
</html>