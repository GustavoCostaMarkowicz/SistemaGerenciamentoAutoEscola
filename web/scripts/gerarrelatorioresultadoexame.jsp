<%@page import="br.edu.ifpr.irati.jsp.controle.ControleInstrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExamePratico"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Instrutor"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleResultadoExame"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.ResultadoExame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.jsp.modelo.Exame"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.jsp.controle.ControleExame"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dataFRelatorio = "2019-01-01";
    String dataIRelatorio = "2017-01-01";
    ControleExame ce = new ControleExame();
    ControleExamePratico cep = new ControleExamePratico();
    ControleResultadoExame cre = new ControleResultadoExame();
    List<Exame> es = ce.buscarExamesPorData(dataIRelatorio, dataFRelatorio);
    List<ResultadoExame> res = new ArrayList();
    List<ResultadoExame> resA = new ArrayList();
    for (Exame e : es) {
        if (ce.verificarTipoExame(e.getIdExame()).equals("pratico")) {
            resA = cre.buscarResultadoExamesPorExame(e.getIdExame());
            for (ResultadoExame re : resA) {
                res.add(re);
            }
        }
    }
    ControleInstrutor ci = new ControleInstrutor();
    List<Instrutor> is = ci.buscarTodosInstrutores();
    List<Integer> porcentagensAp = new ArrayList();
    int total = 0;
    int aprovado = 0;
    double dporcentagem = 0;
    int porcentagem = 0;
    for (Instrutor i : is) {
        total = 0;
        aprovado = 0;
        porcentagem = 0;
        for (ResultadoExame re : res) {
            if (i.getIdPessoa() == cep.buscarExamePraticosPorId(re.getExame().getIdExame()).getInstrutor().getIdPessoa()) {
                total++;
                if (re.getResultado().equals("Aprovado")) {
                    aprovado++;
                }
            }
        }
        if(total > 0){
            dporcentagem = (aprovado*100)/total;
            porcentagem = (int) dporcentagem;
            porcentagensAp.add(porcentagem);
        } else{
            porcentagensAp.add(-1);
        }
    }
%>