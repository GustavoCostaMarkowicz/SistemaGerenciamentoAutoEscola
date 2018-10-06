package br.edu.ifpr.irati.jsp.controle;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Diretor;
import br.edu.ifpr.irati.jsp.modelo.Usuario;
import java.util.List;

public class ControleUsuario {

    public Usuario buscarUsuarioPorLoginESenha(String login, String senha) throws Exception {

        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);

        List<Usuario> usuarios = usuarioDAO.buscarTodos(Usuario.class);
        Usuario u = new Usuario();

        boolean usuarioInvalido = true;
        for (Usuario usuario : usuarios) {
            if (usuario.getLogin().equals(login) & usuario.getSenha().equals(senha)) {
                u = usuario;
                usuarioInvalido = false;
            }
        }

        if (usuarioInvalido) {
            throw new Exception("Acesso negado!");
        } else {
            return u;
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

}
