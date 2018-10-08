package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Aluno;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.ResultadoExame;
import br.edu.ifpr.irati.jsp.controle.ControleResultadoExame;
import java.util.List;
import javax.swing.JOptionPane;

public class TesteResultadoExame {

    public static void main(String[] args) {

        ControleResultadoExame cre = new ControleResultadoExame();
        
        ResultadoExame re = cre.buscarResultadoExamesPorAlunoExame(1, 3);
        
        System.out.println(re.getResultado());
        
    }

}
