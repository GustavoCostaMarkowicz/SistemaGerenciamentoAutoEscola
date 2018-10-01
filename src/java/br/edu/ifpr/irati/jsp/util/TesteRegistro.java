package br.edu.ifpr.irati.jsp.util;

import br.edu.ifpr.irati.jsp.dao.Dao;
import br.edu.ifpr.irati.jsp.dao.GenericDAO;
import br.edu.ifpr.irati.jsp.modelo.Conta;
import br.edu.ifpr.irati.jsp.modelo.Registro;
import br.edu.ifpr.irati.jsp.modelo.Usuario;
import java.util.Date;
import java.util.List;

public class TesteRegistro {

    public static void main(String[] args) {

        Dao<Conta> contaDAO = new GenericDAO<>(Conta.class);
        Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);
        Dao<Registro> registroDAO = new GenericDAO<>(Registro.class);

        Conta c = contaDAO.buscarPorId(5);
        List<Usuario> usuarios = usuarioDAO.buscarTodos(Usuario.class);
        Usuario u = new Usuario();
        for (Usuario usuario : usuarios) {
            if (usuario.getIdUsuario() == 1) {
                u = usuario;
            }
        }
        Registro r = new Registro(0, new Date(), new Date(), " -- Pagamento parcela mês setembro - R$130,00", c, u);

        registroDAO.salvar(r);

        List<Registro> registros = registroDAO.buscarTodos(Registro.class);
        for (Registro registro : registros) {
            System.out.println(registro.getConta().getAluno().getNomeCompleto());
        }

        System.exit(0);

    }

}
