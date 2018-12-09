package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.exception.HashGenerationException;
import br.edu.ifpr.irati.jsp.modelo.Exame;
import br.edu.ifpr.irati.jsp.modelo.Atendente;
import br.edu.ifpr.irati.jsp.util.Digest;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControleAtendente {

    public void inserirAtendente(Atendente a) {

        try {
            a.setSenha(Digest.hashString(a.getSenha(), "SHA-512"));
            Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
            atendenteDAO.salvar(a);
        } catch (HashGenerationException ex) {
            Logger.getLogger(ControleAtendente.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    

    public void alterarAtendente(Atendente a) {
        
        try {
            a.setSenha(Digest.hashString(a.getSenha(), "SHA-512"));
            Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
            atendenteDAO.alterar(a);
        } catch (HashGenerationException ex) {
            Logger.getLogger(ControleAtendente.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void excluirAtendente(Atendente a) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        atendenteDAO.excluir(a);

    }

    public List<Atendente> buscarTodosAtendentes() {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        List<Atendente> atendentes = atendenteDAO.buscarTodos(Atendente.class);
        return atendentes;

    }

    public Atendente buscarAtendentePorId(int idPessoa) {

        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        Atendente a = atendenteDAO.buscarPorId(idPessoa);
        return a;

    }
    

}
