package br.edu.ifpr.irati.jsp.dao;

import br.edu.ifpr.irati.jsp.modelo.Servico;
import java.io.Serializable;
import java.util.List;
import javax.persistence.criteria.Order;

/**
 * @param <T>
 */
public interface Dao<T> {

    public T buscarPorId(Serializable id);

    public void salvar(T t);

    public void alterar(T t);

    public void excluir(T t);

    public List<T> buscarTodos(Class<T> clazz);
    
    
    
}
