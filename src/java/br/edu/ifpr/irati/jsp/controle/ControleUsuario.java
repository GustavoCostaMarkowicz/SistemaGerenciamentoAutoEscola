package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.exception.HashGenerationException;
import br.edu.ifpr.irati.jsp.modelo.Atendente;
import br.edu.ifpr.irati.jsp.modelo.Diretor;
import br.edu.ifpr.irati.jsp.modelo.Usuario;
import br.edu.ifpr.irati.jsp.util.Digest;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControleUsuario {

    public Usuario buscarUsuarioPorLoginESenha(String login, String senha) throws Exception {

        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);

        List<Usuario> usuarios = usuarioDAO.buscarTodos(Usuario.class);
        Usuario u = new Usuario();
        
        String senhaResumo = Digest.hashString(senha, "SHA-512");
        System.out.println(senhaResumo);

        boolean usuarioInvalido = true;
        for (Usuario usuario : usuarios) {
            if (usuario.getLogin().equals(login) & usuario.getSenha().equals(senhaResumo)) {
                u = usuario;
                usuarioInvalido = false;
                break;
            }
        }

        if (usuarioInvalido) {
            throw new Exception("Usuario e/ou senha incorretos!");
        } else {
            return u;
        }

    }

    public void salvarUsuario(Atendente a){
        
        try {
            a.setSenha(Digest.hashString(a.getSenha(), "SHA-512"));
            
            Dao<Atendente> aDAO = new GenericDAO<>(Atendente.class);
            
            aDAO.salvar(a);
            
            
        } catch (HashGenerationException ex) {
            Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public String verificarTipoUsuario(int idUsuario) {

        Dao<Diretor> diretorDAO = new GenericDAO<>(Diretor.class);

        List<Diretor> diretores = diretorDAO.buscarTodos(Diretor.class);

        String tipoUsuario = "";

        for (Diretor diretor : diretores) {
            if (diretor.getIdUsuario() == idUsuario) {
                tipoUsuario = "diretor";
            }
        }

        return tipoUsuario;

    }

    public Usuario buscarUsuarioPorId(int idUsuario) {

        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        Usuario u = usuarioDAO.buscarPorId(idUsuario);
        return u;

    }
    
    
    public List<Atendente> buscarTodosAtendentes(){
        
        Dao<Atendente> atendenteDAO = new GenericDAO<>(Atendente.class);
        List<Atendente> atendentes = atendenteDAO.buscarTodos(Atendente.class);
        return atendentes;
        
    }

}
