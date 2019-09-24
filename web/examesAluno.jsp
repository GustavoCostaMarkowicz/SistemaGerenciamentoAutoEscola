<%-- 
    Document   : examesAluno
    Created on : 05/08/2019, 09:43:05
    Author     : Usuario
--%>

<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameTeorico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePsicotecnico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleAluno"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ExameMedico"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExameMedico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exames do Aluno</title>
        <link rel="shortcut icon" href="imagens/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>

        <%

            String ids = request.getParameter("idPessoa");
            int id = Integer.parseInt(ids);

            ControleAluno ca = new ControleAluno();
            Aluno a = ca.buscarAlunosPorId(id);

            ControleExameMedico cem = new ControleExameMedico();
            ControleExamePsicotecnico cep = new ControleExamePsicotecnico();
            ControleExameTeorico cet = new ControleExameTeorico();
            ControleExamePratico cepra = new ControleExamePratico();
            ControleResultadoExame cre = new ControleResultadoExame();

            List<ExameMedico> ems = cem.buscarExameMedPorIdAluno(id);
            List<ExamePsicotecnico> eps = cep.buscarExamePsicoPorIdAluno(id);
            List<ExameTeorico> ets = cet.buscarExameMedPorIdAluno(id);
            List<ExamePratico> epratico = cepra.buscarExamePraticoPorIdAluno(id);
            
        %>
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

        .input-field .prefix.active {
            color: green;
        }
        
         label#noResultMessage {
            font-size: 25px;
        }
</style>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
            
        <div class="card">
            <div id="titulo" class="amber">
                <h5 align="center">Exames de <%=a.getNomeCompleto()%></h5>

            </div>
          

            <br>
            <div id="titulo" class="red">
            <h5 align="center">Exames Médicos</h5>
            </div>
            <%
                
                
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
                    
                   
                    
                    
           if(!ems.isEmpty()){

           %>
            <table id="tabelaAlunos" name="tabelaAlunos" class="centered striped">
                <thead>
                    <tr>
                        <th>Clínica</th>
                        <th>Médico</th>
                        <th>Data de Exame</th>
                        <th>Horário de Exame</th>
                        <th>Resultado Exame</th>
                        
                    </tr>
                </thead>
                <%
                   
                    
                    
                    int i = 0;
                    for(ExameMedico em: ems){

                %>
                <tbody>
                    <tr>
                        <td id="clinica" name="clinica"><%=em.getClinica() %></td>
                        <td id="medico" name="medico"><%=em.getMedico()%></td>
                        <td id="data" name="data"><%=sdf.format(em.getDataExame()) %></td>
                        <td id="horario" name="horario"><%=sdf1.format(em.getHorarioExame()) %></td>
                        
                        <%
                        if(cre.buscarResultadoExamesPorAlunoExame(id, em.getIdExame()) != null){
                        %>
                        <td><%=cre.buscarResultadoExamesPorAlunoExame(id, em.getIdExame()).getResultado()%></td>
                        <%
                        } else {
                           
                        %>
                        <td><a href="cadastrarResultadoExame.jsp?idexame=<%=em.getIdExame() %>&idaluno=<%=id%>" value="ResultadoExame" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="Cadastrar o resultado do exame"><i class="material-icons">description</i></a></td>
                   <% } %>
                      </tr>
                </tbody>
                <%
                    
                    i++;
                        }

                        } else {
                            
                            %>
                        <div align="center">
                            <label id="noResultMessage" name="noResultMessage">O Aluno não possui cadastrado nenhum Exame Médico</label>
                        </div>
                <%
                            
                        }   
                %>

            </table>
                
                
           <!-- MOSTRAR TODOS OS EXAMES PSICOTÉCNICOS -->
           
           <div id="titulo" class="red">
           <h5 align="center">Exames Psicotécnicos</h5>
           </div>
           <%
           
           if(!eps.isEmpty()){

           %>
           <table id="tabelaPsico" name="tabelaPsico" class="centered striped">
                <thead>
                    <tr>
                        <th>Clínica</th>
                        <th>Psicólogo</th>
                        <th>Data de Exame</th>
                        <th>Horário de Exame</th>
                        <th>Resultado Exame</th>
                        
                    </tr>
                </thead>
                <%
                   
                    
                    
                    
                    for(ExamePsicotecnico ep: eps){

                %>
                <tbody>
                    <tr>
                        <td id="clinica" name="clinica"><%=ep.getClinica() %></td>
                        <td id="medico" name="medico"><%=ep.getPsicologo() %></td>
                        <td id="data" name="data"><%=sdf.format(ep.getDataExame()) %></td>
                        <td id="horario" name="horario"><%=sdf1.format(ep.getHorarioExame()) %></td>
                        
                        <%
                        
                        if(cre.buscarResultadoExamesPorAlunoExame(id, ep.getIdExame()) != null){
                        %>
                        <td id="resultado" name="resultado"><%=cre.buscarResultadoExamesPorAlunoExame(id, ep.getIdExame()).getResultado() %></td>
                        <%
                        } else {
                        %>
                        <td><a href="cadastrarResultadoExame.jsp?idexame=<%=ep.getIdExame() %>&idaluno=<%=id%>" value="ResultadoExame" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="Cadastrar o resultado do exame"><i class="material-icons">description</i></a></td>
                   <% } %>
                      </tr>
                </tbody>
                <%
                        }

                        } else {
                            
                            %>
                        <div align="center">
                            <label id="noResultMessage" name="noResultMessage">O Aluno não possui cadastrado nenhum Exame Psicotécnico</label>
                        </div>
                <%
                            
                        }   
                %>

            </table>
                
                <!-- MOSTRAR TODOS OS EXAMES TEÓRICOS -->
           
           <div id="titulo" class="red">
           <h5 align="center">Exames Teóricos</h5>
           </div>
           <%
           
           if(ets != null){

           %>
           <table id="tabelaTeorico" name="tabelaTeorico" class="centered striped">
                <thead>
                    <tr>
                        <th>Local de Aplicação</th>
                        <th>Instrutor</th>
                        <th>Data de Exame</th>
                        <th>Horário de Exame</th>
                        <th>Resultado Exame</th>
                        
                    </tr>
                </thead>
                <%
                   
                    
                    
                    
                    for(ExameTeorico et: ets){

                %>
                <tbody>
                    <tr>
                        <td id="clinica" name="clinica"><%=et.getLocalAplicacao() %></td>
                        <td id="medico" name="medico"><%=et.getInstrutor().getNomeCompleto() %></td>
                        <td id="data" name="data"><%=sdf.format(et.getDataExame()) %></td>
                        <td id="horario" name="horario"><%=sdf1.format(et.getHorarioExame()) %></td>
                        
                        <%
                        
                        if(cre.buscarResultadoExamesPorAlunoExame(id, et.getIdExame()) != null){
                        %>
                        <td id="resultado" name="resultado"><%=cre.buscarResultadoExamesPorAlunoExame(id, et.getIdExame()).getResultado() %></td>
                        <%
                        } else {
                        %>
                        <td><a href="cadastrarResultadoExame.jsp?idexame=<%=et.getIdExame() %>&idaluno=<%=id%>" value="ResultadoExame" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="Cadastrar o resultado do exame"><i class="material-icons">description</i></a></td>
                   <% } %>
                      </tr>
                </tbody>
                <%
                        }

                        } else {
                            
                            %>
                        <div align="center">
                            <label id="noResultMessage" name="noResultMessage">O Aluno não possui cadastrado nenhum Exame Psicotécnico</label>
                        </div>
                <%
                            
                        }   
                %>

            </table>
                
                    <!-- MOSTRAR TODOS OS EXAMES PRÁTICO -->
           
           <div id="titulo" class="red">
           <h5 align="center">Exames Prático</h5>
           </div>
           <%
           
           if(epratico != null){

           %>
           <table id="tabelaPratico" name="tabelaPratico" class="centered striped">
                <thead>
                    <tr>
                        <th>Categoria</th>
                        <th>Instrutor</th>
                        <th>Veículo</th>
                        <th>Data de Exame</th>
                        <th>Horário de Exame</th>
                        <th>Resultado Exame</th>
                       
                        
                    </tr>
                </thead>
                <%
                   
                    
                    
                    
                    for(ExamePratico epra: epratico){

                %>
                <tbody>
                    <tr>
                        <td id="clinica" name="clinica"><%=epra.getCategoria() %></td>
                        <td id="medico" name="medico"><%=epra.getInstrutor().getNomeCompleto() %></td>
                        <td id="clinica" name="clinica"><%=epra.getVeiculo().getPlaca() %></td>
                        <td id="data" name="data"><%=sdf.format(epra.getDataExame()) %></td>
                        <td id="horario" name="horario"><%=sdf1.format(epra.getHorarioExame()) %></td>
                        
                        <%
                        
                        if(cre.buscarResultadoExamesPorAlunoExame(id, epra.getIdExame()) != null){
                        %>
                        <td id="resultado" name="resultado"><%=cre.buscarResultadoExamesPorAlunoExame(id, epra.getIdExame()).getResultado() %></td>
                        <%
                        } else {
                        %>
                        <td><a href="cadastrarResultadoExame.jsp?idexame=<%=epra.getIdExame()%>&idaluno=<%=id%>" value="ResultadoExame" class="tooltipped btn-floating waves-effect waves-light black" data-position="left" data-tooltip="Cadastrar o resultado do exame"><i class="material-icons">description</i></a></td>
                   <% } %>
                      </tr>
                </tbody>
                <%
                        }

                        } else {
                            
                            %>
                       <div align="center">
                            <label id="noResultMessage" name="noResultMessage">O Aluno não possui cadastrado nenhum Exame Psicotécnico</label>
                        </div>
                <%
                            
                        }   
                %>

            </table>
            
        </div>
                
        <footer>
        <jsp:include page="rodape.jsp" flush="true" />
        </footer>
    </body>
   
</html>
